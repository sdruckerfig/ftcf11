<cfparam name="form.searchterm" default="">


<cfset q = application.cfc.Asset.get(form.searchterm)>


<cfinclude template="#application.basehref#includes/header.cfm">


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
	</tr>
	<cfoutput query="q">
		<tr>
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
		</tr>
	</cfoutput>
</table>

<input type="button" 
	value="Add New Document" 
	onclick="location.href='admin/asset.cfm'">


<cfinclude template="#application.basehref#includes/footer.cfm">