<cfcomponent output="false">
  <cfset this.name = "MyApp">
  <cfset this.datasource = "MyDataSource">
  <cfset this.sessionManagement = true>
  <cfset this.clientManagement = false>
  
  <cffunction name="onApplicationStart">
  	
  	<!--- perform application initialization here --->
  	
  	<cfreturn true>	
  </cffunction>
  
  <cffunction name="onRequestStart">
  	
  	<!--- run code on every page --->
  	<cfif isDefined("url.init")>
  		<cfset onApplicationStart()>
  	</cfif>
  	
  	<cfreturn true>	
  </cffunction>
  
</cfcomponent>