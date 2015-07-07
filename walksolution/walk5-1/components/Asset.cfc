<cfcomponent hint="CRUD for the Asset Table" output="false">

	<cffunction name="get" access="public" returntype="query">
		<cfargument name="timespan" default="#createtimespan(0,0,1,0)#">
		
		<cfif isdefined("url.init")>
			<cfset arguments.timespan = createtimespan(0,0,0,0)>
		</cfif>
		
		<cfquery name="local.q" cachedwithin="#arguments.timespan#">
			
			select 	asset.id, 
					asset.title,
					asset.updatedate,
					company.companyName,
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
			order by updatedate desc
			
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>

</cfcomponent>