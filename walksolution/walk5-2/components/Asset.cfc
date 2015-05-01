<cfcomponent hint="CRUD for the Asset Table" output="false">

	<cffunction name="get" access="public" returntype="query">
		<cfargument name="searchterm" required="false" default="">
		
		<cfquery name="local.q">
			select 	asset.id, 
					asset.title,
					asset.updatedate,
					company.companyName,
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
			
			order by updatedate desc
			
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>


</cfcomponent>