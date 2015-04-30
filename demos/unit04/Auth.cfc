<cfcomponent>

  <cffunction name="authenticate" access="public" returntype="boolean">
  	  <cfargument name="username" type="string" required="true">
  	  <cfargument name="password" type="string" required="true">
  	  
  	  <cflogin>
  	  	 <!--- query ldap, nt domain, or custom database here --->
  	  	 <!--- use cfldap, cfntauthenticate(), or <cfquery> --->
  	  	 
  	  	 <!--- if valid login, use <cfloginuser> to log the user in --->
  	  	 <cfloginuser  
  	  	 	name="#arguments.username#"
  	  	 	password="#arguments.password#"
  	  	 	roles="user,admin" />
  	  	 
  	  </cflogin>
  	  
  	  <cfif getAuthUser() is not "">
  	  	<cfreturn true>
  	  <cfelse>
  	    <cfreturn false>
  	  </cfif>
  	  
  </cffunction>
  
  
   <cffunction name="logout" access="public" returntype="boolean">

		<!--- clean up after user --->
		<cflogout>
		<cfreturn true>
   </cffunction>

</cfcomponent>