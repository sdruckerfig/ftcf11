<cfcomponent hint="CRUD for the Asset Table" output="false">

	<cffunction name="uploadFile" access="public" roles="admin,superadmin" returntype="string">
		
		
		<cffile action="upload"
			destination="#application.uploaddir#" 
			filefield="fileupload"
			accept="image/jpg,image/jpeg"
			nameconflict="makeunique" 
			result="local.stData">
		
		<cfreturn stdata.serverfile>
		
	</cffunction>
	
	<cffunction name="downloadFile" access="remote" returntype="void">
		
			<cfargument name="id" type="numeric" required="true">
			
			<cfset local.qrec = get(id=arguments.id)>
			<cfset local.filespec = application.uploaddir & local.qrec.filename>
			
			<cflog file="downloader" 
			   text="Filespec: #local.filespec#, #local.qrec.filename#, #local.qrec.recordcount#" 
			   type="information">
			
			<cfheader name="Content-Disposition" value="attachment; filename=#local.qrec.filename#">
			<cfcontent file="#local.filespec#">
			
		
	</cffunction>


	<cffunction name="createRecord" access="public" roles="admin,superadmin" returntype="Numeric">
		
		<cfargument name="title" required="yes" type="string">
		<cfargument name="idCompany" required="yes" type="numeric">
		<cfargument name="description" required="yes" type="string">
		<cfargument name="contentUrl" required="yes" type="string">
		<cfargument name="idAssetType" required="yes" type="numeric">
		
		<cfif isdefined("form.fileUpload")>
			<cfset local.filename = uploadFile()>
		<cfelse>
			<cfset local.filename = "">
		</cfif>
		
		<cfquery result="local.stResult">
			insert into Asset (
				filename, title, idCompany, description, contentUrl, idAssetType, updateuser, updatedate, begintime
			)
			values (
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.filename#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#" >,
				<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idCompany#" >,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.description#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.contentUrl#">,
				<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idAssetType#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#getAuthUser()#">,
				<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
				<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">
			)
			
		</cfquery>
		
		<cfreturn local.stResult.generatedKey>
		
	</cffunction>


	<cffunction name="get" access="public" returntype="query">
		<cfargument name="searchterm" required="false" type="string" default="">
		<cfargument name="timespan" default="#createtimespan(0,0,1,0)#">
		<cfargument name="id" type="numeric" required="false" default="0">
		
		<cfif isdefined("url.init") or trim(arguments.searchterm) is not "" or arguments.id gt 0>
			<cfset arguments.timespan = createtimespan(0,0,0,0)>
		</cfif>
		
		<cfquery name="local.q" cachedwithin="#arguments.timespan#">
			select 	asset.id, 
					asset.title,
					asset.updatedate,
					company.companyName,
					asset.filename,
					assetType.text as assetType
			from	asset join company
						on asset.idCompany = company.id
					join assetType
						on asset.idAssetType = AssetType.id	
			where 	asset.endtime is null
			
			<cfif arguments.searchterm is not "">
				  and match(title,description,fullContent) against (
				  	<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.searchterm#">
				  )
			</cfif>
			
			<cfif arguments.id gt 0>
				and asset.id = <cfqueryparam 
								cfsqltype="cf_sql_numeric"
								value="#arguments.id#">
			</cfif>
			
			order by updatedate desc
			
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>

</cfcomponent>