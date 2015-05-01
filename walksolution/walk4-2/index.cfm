

<cfinclude template="#application.basehref#includes/header.cfm">


<h1>Welcome to Proposal Manager!</h1>

<cfoutput>
	Your new password is #application.cfcUtils.generatePassword(10)#
</cfoutput
>
<cfinclude template="#application.basehref#includes/footer.cfm">