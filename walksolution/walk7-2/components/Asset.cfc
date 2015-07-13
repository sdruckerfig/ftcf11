<cfcomponent hint="CRUD for the Asset Table" output="false" rest="true" restpath="asset">

	<cffunction name="uploadFile" access="private" roles="admin,superadmin" returntype="string">
		
		<cfset var stData = {}>
		
		<cffile action="upload"
			destination="#application.uploaddir#" 
			filefield="fileupload"
			accept="image/jpg,image/jpeg"
			nameconflict="makeunique" 
			result="stData">
		
		<cfreturn stdata.serverfile>
		
	</cffunction>
	
	<cffunction name="downloadFile" access="remote" returntype="void">
		
			<cfargument name="id" type="numeric" required="true">
			
			<cfset local.qrec = get(id=arguments.id)>
			<cfset local.filespec = application.uploaddir & local.qrec.filename>
			
			<cflog file="downloader" 
			   text="Filespec: #local.qrec.filename#, #local.qrec.recordcount#" 
			   type="information">
			
			<cfheader name="Content-Disposition" value="attachment; filename=#local.qrec.filename#">
			<cfcontent file="#local.filespec#">
			
		
	</cffunction>


	<cffunction name="createRecord" access="remote" roles="admin,superadmin" returntype="Numeric">
		
		<cfargument name="title" required="yes" type="string">
		<cfargument name="idCompany" required="yes" type="numeric">
		<cfargument name="description" required="yes" type="string">
		<cfargument name="contentUrl" required="yes" type="string">
		<cfargument name="idAssetType" required="yes" type="numeric">
		
		<cfif isdefined("form.fileUpload") and form.fileupload is not "">
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




	<cffunction name="updateRecord" access="public" roles="admin,superadmin" returntype="Numeric">
		
		<cfargument name="id" required="yes" type="numeric">
		<cfargument name="title" required="yes" type="string">
		<cfargument name="idCompany" required="yes" type="numeric">
		<cfargument name="description" required="yes" type="string">
		<cfargument name="contentUrl" required="yes" type="string">
		<cfargument name="idAssetType" required="yes" type="numeric">
		
		<cfif isdefined("form.fileUpload") and form.fileupload is not "">
			<cfset local.filename = uploadFile()>
		<cfelse>
			<cfset local.filename = "">
		</cfif>
		
		<cfquery result="local.stResult">
			update Asset 
			 set 
			 title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#" >,
			 <cfif local.filename is not "">
			 filename = <cfqueryparam cfsqltype="cf_sql_varchar" value="#local.filename#">,
			 </cfif>
			 idCompany = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idCompany#" >,
			 description = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.description#">,
			 contentUrl = 	<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.contentUrl#">,
			 idAssetType = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idAssetType#">,
			 updateuser = <cfqueryparam cfsqltype="cf_sql_varchar" value="#getAuthUser()#">,
			 updatedate = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
			 begintime = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">
		  where id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.id#">
		</cfquery>
		
		<cfreturn arguments.id>
		
	</cffunction>


	<cffunction name="get" access="remote" returntype="query" httpMethod="GET">
		
		<cfargument name="searchterm" required="false" type="string" default="" restargsource="query">
		<cfargument name="id" type="numeric" required="false" default="-1" restargsource="query">
		
		
		<cfquery name="local.q">
			select 	asset.id, 
					asset.title,
					asset.updatedate,
					company.companyName,
					asset.filename,
					assetType.text as assetType,
					asset.idAssetType,
					asset.idCompany,
					asset.description,
					asset.contentUrl
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
			
			<cfif arguments.id gt -1>
				and asset.id = <cfqueryparam 
								cfsqltype="cf_sql_numeric"
								value="#arguments.id#">
			</cfif>
			
			order by updatedate desc
			
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>
	

	<cffunction name="getdetail" 
            access="remote"
            returntype="query"
            httpMethod="get"
            restpath="{id}">
  
 		<cfargument name="id" type="string" required="true" restargsource="Path">

 		<cfset local.q = get(id=arguments.id)>

 		<cfreturn local.q>

 	</cffunction>

	
	<cffunction name="deleteRecord" access="public" roles="admin,superadmin" returntype="struct">
		<cfargument name="id" type="numeric" required="true">
		
		<cfquery>
			update asset
			set 
			endtime = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
			updateuser = <cfqueryparam cfsqltype="cf_sql_varchar" value="#getAuthUser()#">
			where id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.id#">
		</cfquery>
		
		<cfreturn {
			  id =  arguments.id,
			  success = true
		}> 
		
	</cffunction>


</cfcomponent>

