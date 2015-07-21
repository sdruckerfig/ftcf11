<cfcomponent output="false">
	
	<cfset this.name = "ProposalManager51">
	<cfset this.datasource = "ProposalManager">
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement = false>
	
	<cffunction name="onApplicationStart">
		
		<cfset application.basehref = "/ftcf11/walk/walk5-1/">
		<cfset application.cfcpath = "ftcf11.walk.walk5-1.components.">
		<cfset application.cssHref = "/ftcf11/shared/css/">

		<cfset application.cfc = structnew()>
		
		<cfset application.cfc.Login = createObject(
			"component",
			"#application.cfcpath#Login"
		)>
		
		<!--- step 10 --->
		
		
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetpage" required="true" type="string">
		
		<cfif isdefined("url.init")>
			<cfset onApplicationStart()>
		</cfif> 
		
		<cfif not isUserInAnyRole("superadmin,admin") and
			  arguments.targetpage contains "/admin/">
			  
			  <cflocation url="#application.basehref#login/index.cfm">
			  
		</cfif>
		
	</cffunction>

</cfcomponent>