<cfcomponent output="false">
	
	<cfset this.name = "ProposalManager62Solution">
	<cfset this.datasource = "ProposalManager">
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement = false>
	
	<cffunction name="onApplicationStart">
		
		<cfset application.basehref = "/ftcf11/walksolution/walk6-2/">
		<cfset application.cfcpath = "ftcf11.walksolution.walk6-2.components.">
		<cfset application.cssHref = "/ftcf11/shared/css/">
		<cfset application.uploadDir = expandpath('.') & "/../../data">
		<cfset application.PDFGenDir = expandpath('.') & "/generatedpdfs/">
		
		<cfset application.cfc = structnew()>
		
		<cfset local.cfcList = "Base,Login,Asset,Company,AssetType">
		
		<cfloop list="#local.cfcList#" index="local.thisCfcName">
			<cfset application.cfc[local.thisCfcName] = createObject(
				"component",
				"#application.cfcpath##local.thisCfcName#"
			)>
		</cfloop>
		
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestStart">
		<cfargument name="targetpage" required="true" type="string">
		
		<cfif isdefined("url.init")>
			<cfset onApplicationStart()>
			<cfset onSessionStart()>
		</cfif> 
		
		<cfif not isUserInRole("SuperAdmin") and
			  arguments.targetpage contains "/admin/">
			  
			  <cflocation url="#application.basehref#login/index.cfm">
			  
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="onSessionStart">
		
		<cfif not isdefined("session.username")>
			<cfset session.username = "Anonymous">
		</cfif>
		
	</cffunction>

</cfcomponent>