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

<cfform preservedata="true" >
	<label for="searchterm">Search Term:</label>
	<cfinput type="text" name="searchterm">
	<cfinput name="btnSubmit" type="submit" value="Search">
</cfform>

<cfoutput>
	<h2>There are #q.recordcount# documents</h2>
</cfoutput>

<cfif q.recordcount gt 0>
	<table border="1">
		<tr>
			<th>Updated</th>
			<th>Title</th>
			<th>Type</th>
			<th>Company</th>
		</tr>
		<cfoutput query="q">
			<tr>
				<td>#dateFormat(q.updatedate)#</td>
				<td>#q.title#</td>
				<td>#q.assetType#</td>
				<td>#q.companyName#</td>
			</tr>
		</cfoutput>
	</table>
</cfif>

<cfinclude template="#application.basehref#includes/footer.cfm">