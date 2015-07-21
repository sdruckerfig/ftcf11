<cfinclude template="../includes/header.cfm">


<cfif isdefined("url.email")>
	
	<cfset sentEmail = application.cfc.Login.sendPassword(url.email)>
	
	<cfoutput><h3>Reminder email sent!</h3></cfoutput>
	
</cfif>

<script type="text/javascript">
	function forgotPassword() {
		var email = window.prompt("Enter your email address");
		if (email) {
			location.href = 'index.cfm?email=' + escape(email);
		}
	}
</script>


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
	<input type="button" value="Forgot Password" onclick="forgotPassword()">
		
</cfform>



<cfinclude template="../includes/footer.cfm">


