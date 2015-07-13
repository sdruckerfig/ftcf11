<cfparam name="form.searchterm" default="">


<cfset q = application.cfc.Asset.get(form.searchterm)>


<cfinclude template="#application.basehref#includes/header.cfm">

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

<cfsavecontent variable="pagecontent">
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
				<cfif q.filename is not "">
					<a href="components/asset.cfc?method=downloadfile&id=#id#">
					[download]
					</a>
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
</cfsavecontent>

<cfif not isdefined("url.print")>
	<cfoutput>#variables.pagecontent#</cfoutput>
<cfelse>
	<!---
	<cfhtmltopdf source="http://www.figleaf.com">
	  <cfoutput>#variables.pagecontent#</cfoutput>
	</cfhtmltopdf>
	--->
	<cfhtmltopdf>
	 	<cfoutput>#variables.pagecontent#</cfoutput>
	</cfhtmltopdf>
	<cfabort>
</cfif>


<input type="button" 
	value="Print" 
	onclick="location.href='index.cfm?print'">

<input type="button" 
	value="Download" 
	onclick="location.href='index.cfm?excel'">


<cfinclude template="#application.basehref#includes/footer.cfm">