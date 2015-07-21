<cfcomponent output="false">

  <cffunction name="login" access="remote" hint="Authenticate User" returntype="boolean" >
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

  <cffunction name="sendPassword" access="public" hint="password reminder" returntype="boolean">
    <cfargument name="email" type="string" required="true">
    
    <cfquery name="local.q">
      select password
      from appuser
      where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
      and endtime is null
    </cfquery>
    
    <cfif local.q.recordcount ge 1>
      <cfmail 
         from="info@figleaf.com"
         to="sdrucker@figleaf.com"
         subject="Password Reminder"
         type="html">
         
         <p>Your password is #local.q.password#</p>
         
      </cfmail>
      <cfreturn true>
    <cfelse>
      <cfreturn false>
    </cfif>
    
    
  </cffunction>
  

</cfcomponent>