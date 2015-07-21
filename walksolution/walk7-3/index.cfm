<cfparam name="form.searchterm" default="">


<cfwebsocket name="webSocketObj"
             onMessage="messageHandler"
             onError="errorHandler"
             onOpen="openHandler"
             onClose="closeHandler"
             subscribeTo="chat"/>


<cfset q = application.cfc.Asset.get(form.searchterm)>


<cfinclude template="#application.basehref#includes/header.cfm">

<script type="text/javascript">
         
        messageHandler =  function(aEvent,aToken) {
          
          if (aEvent.data) {
           var txt=document.getElementById("msgArea"); 
           txt.innerHTML += aEvent.data  +"<br />"; 
          }
        }
         
        openHandler = function() {
            alert("Connection is open");
        }
         
        closeHandler= function() {
            alert("Connection Closed");
        }
         
        errorHandler = function() {
            alert("Doh!");
            console.log(arguments);
        }
         
        sendMessage = function() {
            var text = window.prompt("Enter some text","");
            if (text) {
                webSocketObj.publish("chat", text);
            }
        }
</script>


<cfif isdefined("url.newId")>
	<cfoutput>
	<style>
		##asset#url.newId# {
			background-color: yellow;
		}
	</style>
	</cfoutput>
</cfif>


<script type="text/javascript">
	function deleteRecord(id,label) {
		if (confirm("Delete " + label + "?")) {
			location.href='admin/asset.cfm?id=' + id + '&action=delete'
		}
	}
</script>


<h1>
	Welcome to Proposal Manager
	<cfif getAuthUser() is not "">
		<cfoutput>#getAuthUser()#</cfoutput>
	</cfif>
	!
</h1>

<cfoutput>
	<h2>There are #q.recordcount# documents</h2>
</cfoutput>

<cfform preservedata="true" >
	<label for="searchterm">Search Term:</label>
	<cfinput type="text" name="searchterm">
	<cfinput name="btnSubmit" type="submit" value="Search">
</cfform>

<table border="1">
	<tr>
		<th>Updated</th>
		<th>Title</th>
		<th>Type</th>
		<th>Company</th>
		<th>Download</th>
		<th>Edit</th>
		<th>Del</th>
	</tr>
	<cfoutput query="q">
		<tr id="asset#q.id#">
			<td>#dateFormat(q.updatedate)#</td>
			<td>#q.title#</td>
			<td>#q.assetType#</td>
			<td>#q.companyName#</td>
			<td>
				<cfif assetType is "Bio">
					<a href="components/asset.cfc?method=downloadBioPDFfile&id=#id#">
						[download Bio PDF]
					</a>
				<cfelse>
					<cfif q.filename is not "">
						<a href="components/asset.cfc?method=downloadfile&id=#id#">
						[download]
						</a>
					</cfif>
				</cfif>
			</td>
			<td>
				<a href="admin/asset.cfm?id=#q.id#">[Edit]</a>
			</td>
			<td>
				<a href="javascript:deleteRecord(#q.id#,'#jsStringFormat(q.title)#')">[Del]</a>
			</td>
		</tr>
	</cfoutput>
</table>

<cfoutput>
<input type="button" value="Download List" onClick="location.href='components/asset.cfc?method=downloadspreadsheet&searchterm=#urlencodedformat(form.searchterm)#'">
</cfoutput>

<div style="position:fixed; bottom:0; right:10; height: 200px; width:300px; border: 1px solid black; background-color: white">
	<div style="width:100%; height: 30px; background-color: black; color: white;">Chat</div>
	<div id="msgArea" style="width:290px; height:130px; overflow: auto; background-color: white; padding: 5px"></div>
	<div style="text-align:center;">
	<input type="button" value="Send Message" onClick="sendMessage()">
	</div>
</div>


<cfinclude template="#application.basehref#includes/footer.cfm">