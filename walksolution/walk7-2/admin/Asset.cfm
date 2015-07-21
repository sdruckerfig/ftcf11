<cfparam name="url.id" default="0">

<!--- handle record save --->

<cfif isdefined("url.action") and url.action is "delete">
	<cfset application.cfc.Asset.deleteRecord(id=url.id)>
	<cflocation url="../index.cfm">
</cfif>


<!--- handle record save --->

<cfif isdefined("form.btnSubmit")>
	
	<cfif form.id is 0>
		<cfset newId = application.cfc.Asset.createRecord(
			title = form.title,
			idCompany = form.idCompany,
			description = form.description,
			contentUrl = form.contentUrl,
			idAssetType = form.idAssetType,
			fullContent = form.fullContent
		)>
	<cfelse>
		<cfset newId = application.cfc.Asset.updateRecord(
			title = form.title,
			idCompany = form.idCompany,
			description = form.description,
			contentUrl = form.contentUrl,
			idAssetType = form.idAssetType,
			fullContent = form.fullContent,
			id=form.id
		)>
	</cfif>
	
	<cfoutput>
		<script type="text/javascript">
			alert("Record Saved");
			location.href = "../index.cfm?newId=#variables.newId#";
		</script>
	</cfoutput>
	
</cfif>


<!--- handle record load --->

<cfset qRec = application.cfc.asset.get(id=url.id)>

<cfif qrec.recordcount is 0>
	<!--- add empty row --->
	<cfset queryAddRow(qRec)>
</cfif>


<cfset qCompanies = application.cfc.Company.get()>
<cfset qAssetTypes = application.cfc.AssetType.get()>

<cfinclude template="../includes/header.cfm">

<script src="//tinymce.cachefly.net/4.2/tinymce.min.js"></script>
<script>
  tinymce.init({
	selector:'#fullContent',
	 plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks code fullscreen",
        "insertdatetime media table contextmenu paste"
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link"
 });
</script>

	<h1>Create/Edit Asset</h1>

	<cfform enctype="multipart/form-data">

		<div style="float:left; margin-right: 10px">
		<cfinput type="hidden" name="id" value="#url.id#">
		<label for="title">Title:</label>
		<cfinput type="text" name="title" required="true" value="#qrec.title#">
		<br />
		
		
		<label for="idAssetType">Type:</label>
		<cfselect 
			name="idAssetType"
			query="qAssetTypes"
			display="text"
			value="id"
			queryPosition="below"
			required="true" selected="#qrec.idAssetType#">
		
		   <option value="">Please Select</option>
		
		</cfselect>
		<br />
		
		
		<label for="idCompany">Company:</label>
		<cfselect 
			name="idCompany"
			query="qCompanies"
			display="companyName"
			value="id"
			queryPosition="below"
			required="true" selected="#qrec.idcompany#">
		   <option value="">Please Select</option>
		</cfselect>
		<br />
			
		<label for="contentUrl">Url:</label>
		<cfinput type="text" name="contentUrl" value="#qrec.contentUrl#">
		<br />
		
		<label for="fileupload">File Attachment:</label>
		<cfinput type="file" name="fileupload">
		<br />	

		</div>
		
		<div>
		<label for="description" style="width:300px">Description (255 Chars Max):</label><br />
		<cftextarea name="description" style="height: 165px; min-width: 550px; width: 50%" value="#qrec.description#"></cftextarea>
		</div>
		<br />
	
		
		<label for="description">Full Content:</label><br />
		<cftextarea name="fullContent" 
				  id="fullContent"
				  style="height:300px; width:500px"
				  value="#qrec.fullContent#"></cftextarea>
		
		<br />
		<cfinput type="submit" name="btnSubmit" value="Save">
		
		
	</cfform>


<cfinclude template="../includes/footer.cfm">


