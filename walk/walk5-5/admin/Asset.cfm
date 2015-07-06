<!--- step 5 --->

<cfif isdefined("form.btnSubmit")>
	
	<cfset newId = application.cfc.Asset.createRecord(
		title = form.title,
		idCompany = form.idCompany,
		description = form.description,
		contentUrl = form.contentUrl,
		idAssetType = form.idAssetType
	)>
	
	<cfoutput>
		<script type="text/javascript">
			alert("Record Saved");
			location.href = "../index.cfm?newId=#variables.newId#";
		</script>
	</cfoutput>
	
</cfif>




<cfset qCompanies = application.cfc.Company.get()>
<cfset qAssetTypes = application.cfc.AssetType.get()>

<!--- step 6: handle record load --->



<cfinclude template="../includes/header.cfm">


	<h1>Create/Edit Asset</h1>

	<cfform enctype="multipart/form-data">
		
		<label for="title">Title:</label>
		<cfinput type="text" name="title" required="true">
		<br />
		
		
		<label for="idAssetType">Type:</label>
		
		<cfselect 
			name="idAssetType"
			query="qAssetTypes"
			display="text"
			value="id"
			queryPosition="below"
			required="true">
		
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
			required="true">
		
		   <option value="">Please Select</option>
		
		</cfselect>
		<br />
			
		
		<label for="description">Description:</label>
		<cftextarea name="description"></cftextarea>
		<br />
		
		<label for="contentUrl">Url:</label>
		<cfinput type="text" name="contentUrl">
		<br />
		
		<label for="fileupload">File Attachment:</label>
		<cfinput type="file" name="fileupload">
		<br />
		
		<cfinput type="submit" name="btnSubmit" value="Save">
		
	</cfform>


<cfinclude template="../includes/footer.cfm">