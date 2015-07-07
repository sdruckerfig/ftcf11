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
			idAssetType = form.idAssetType
		)>
	<cfelse>
		<cfset newId = application.cfc.Asset.updateRecord(
			title = form.title,
			idCompany = form.idCompany,
			description = form.description,
			contentUrl = form.contentUrl,
			idAssetType = form.idAssetType,
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


	<h1>Create/Edit Asset</h1>

	<cfform enctype="multipart/form-data">
		
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
			
		
		<label for="description">Description:</label>
		<cftextarea name="description" value="#qrec.description#"></cftextarea>
		<br />
		
		<label for="contentUrl">Url:</label>
		<cfinput type="text" name="contentUrl" value="#qrec.contentUrl#">
		<br />
		
		<label for="fileupload">File Attachment:</label>
		<cfinput type="file" name="fileupload">
		<br />
		
		<cfinput type="submit" name="btnSubmit" value="Save">
		
	</cfform>


<cfinclude template="../includes/footer.cfm">


