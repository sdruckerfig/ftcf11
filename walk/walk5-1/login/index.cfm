<cfmodule template="../includes/header.cfm" pageTitle="Authenticate!">

<cfif isdefined("form.username")>
	<cfif application.cfc.login.Login(form.username,form.password)>
		<cflocation url="../index.cfm">
	<cfelse>
		Authentication failed - Please Try Again!
	</cfif>
</cfif>

<cfform preservedata="true">
	
	<label for="username">User Name:</label>
	<cfinput 	type="text"
				name="username" 
				required="true" 
				message="You must enter a user name"
				validateAt="onsubmit,onserver">
	<br />
	<label for="password">Password:</label>
	<cfinput 	type="password" 
				name="password" 
				required="true" 
				message="You must enter a password"
				validateAt="onsubmit,onserver">
	<br />

	<cfinput type="submit" name="btnSubmit" value="Submit!" validate="submitonce">
	
</cfform>



<cfinclude template="../includes/footer.cfm">

