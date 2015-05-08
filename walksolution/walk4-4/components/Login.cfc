<cfcomponent output="false" extends="Base">

  <cffunction name="login" access="public" hint="Authenticate User" returntype="boolean" >
  	<cfargument name="username" type="string" required="true">
  	<cfargument name="password" type="string" required="true">
  	
  	<cflogin>
  		<!--- do database authentication here --->
  		
  		<cfloginuser 
  			name="#arguments.username#" 
  			password="#arguments.password#" 
  			roles="superadmin">
  	
  	</cflogin>
  	
  	<cfif getAuthUser() is "">
  		<cfreturn false>
  	<cfelse>
  		<cfreturn true>
  	</cfif>
  	
  </cffunction>
  
  <cffunction name="logout" access="public" hint="Log out user" returntype="boolean"  roles="superadmin,admin,user">
  	
  	<cflogout>
  	<cfreturn true>
  	
  </cffunction>
  

</cfcomponent>