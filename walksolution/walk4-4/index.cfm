

<cfinclude template="#application.basehref#includes/header.cfm">

<h1>
	Welcome to Proposal Manager
	<cfif getAuthUser() is not "">
		<cfoutput>#getAuthUser()#</cfoutput>
	</cfif>
	!
</h1>

<cfinclude template="#application.basehref#includes/footer.cfm">