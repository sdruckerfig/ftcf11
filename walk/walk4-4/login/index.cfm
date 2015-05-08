<cfmodule template="../includes/header.cfm" pageTitle="Authenticate!">

<!--- step 9 --->

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

