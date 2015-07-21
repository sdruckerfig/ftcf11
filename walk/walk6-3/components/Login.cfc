<cfcomponent output="false">

  <cffunction name="login" access="public" hint="Authenticate User" returntype="boolean" >
  	<cfargument name="username" type="string" required="true">
  	<cfargument name="password" type="string" required="true">
  	
  	<cflogin>
  		<!--- do database authentication here --->
  		<cfstoredproc procedure="authenticate">
        <cfprocparam type="in" cfsqltype="cf_sql_varchar" value="#arguments.username#">
        <cfprocparam type="in" cfsqltype="cf_sql_varchar" value="#arguments.password#">
        <cfprocresult name="local.q" resultset="1">
      </cfstoredproc>
      
      <!---
  		<cfquery name="local.q">
  			select Appuser.*, UserRole.label as roleName 
  			from AppUser inner join UserRole
  			 on AppUser.idRole = UserRole.id
  			where AppUser.endtime is null
  			and 
  			  username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.username#">
  			and 
  			  password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.password#">
  		</cfquery>
      --->
  		
  		<cfif local.q.recordCount is 1>
	  		<cfloginuser 
	  			name="#arguments.username#" 
	  			password="#arguments.password#" 
	  			roles="#local.q.roleName#">
  		</cfif>
  	</cflogin>
  	
  	<cfif getAuthUser() is "">
  		<cfreturn false>
  	<cfelse>
  		<cfreturn true>
  	</cfif>
  	
  </cffunction>
  
  <cffunction name="logout" access="public" hint="Log out user" returntype="boolean">
  	
  	<cflogout>
  	<cfreturn true>
  	
  </cffunction>


  <!--- step 13 --->

  

</cfcomponent>