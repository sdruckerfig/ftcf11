<cfcomponent output="false">
	
	<cfset this.name = "ProposalManager">
	<cfset this.datasource = "ProposalManager">
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement = false>
	
	<cffunction name="onApplicationStart">
		
		<cfset application.baseHref = "/ftcf11/walksolution/walk4-1/">
		<cfset application.cssHref = "/ftcf11/shared/css/">
		
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetpage" required="true" type="string">
		
		<cfif isdefined("url.init")>
			<cfset onApplicationStart()>
		</cfif> 
		
	</cffunction>
	
</cfcomponent>