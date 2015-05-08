

<cfinclude template="#application.basehref#includes/header.cfm">


<h1>Welcome to Proposal Manager!</h1>

<!--- step 17 --->
<cfoutput>
	Your password is #application.cfc.Login.generatePassword(10)#
</cfoutput>


<cfinclude template="#application.basehref#includes/footer.cfm">