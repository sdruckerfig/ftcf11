<cfinclude template="../includes/header.cfm">


<!--- step 10 --->



<!--- step 3 --->




<cfif isdefined("form.username")>
	<cfif application.cfc.login.Login(form.username,form.password)>
		<cflocation url="../index.cfm">
	<cfelse>
		Authentication failed - Please Try Again!
	</cfif>
</cfif>

<h1>Please Login</h1>

<cfform preservedata="true">
	
	<label for="username">User Name:</label>
	<cfinput 	type="text" 
				name="username" 
				required="true" 
				message="You must enter a user name">
	<br />
	<label for="password">Password:</label>
	<cfinput 	type="text" 
				name="password" 
				required="true" 
				message="You must enter a password">
	<br />
	
	<cfinput type="submit" name="btnSubmit" value="Authenticate!">
	
	<!--- step 2 --->

</cfform>



<cfinclude template="../includes/footer.cfm">


