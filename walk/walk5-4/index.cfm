<cfparam name="form.searchterm" default="">

<cfif not isdefined("url.newId")>
	<cfset q = application.cfc.Asset.get(form.searchterm)>
<cfelse>
	<cfset q = application.cfc.Asset.get(form.searchterm,0)>
</cfif>

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
	</tr>
	<cfoutput query="q">
		<tr id="asset#q.id#">
			<td>#dateFormat(q.updatedate)#</td>
			<td>#q.title#</td>
			<td>#q.assetType#</td>
			<td>#q.companyName#</td>
		</tr>
	</cfoutput>
</table>


<cfinclude template="#application.basehref#includes/footer.cfm">