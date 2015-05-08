<cfcomponent output="false">
	
	<cfset this.name = "ProposalManager42">
	<cfset this.datasource = "ProposalManager">
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement = false>
	
	<cffunction name="onApplicationStart">
		
		<cfset application.basehref = "/ftcf11/walksolution/walk4-2/">
		<cfset application.cfcpath = "ftcf11.walksolution.walk4-2.components.">
		
		<cfset application.cfc = {
			login = createObject("component","#application.cfcpath#Login")
		}> 
	
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetpage" required="true" type="string">
		
		<cfif isdefined("url.init")>
			<cfset onApplicationStart()>
		</cfif> 
		
	</cffunction>
	

</cfcomponent>