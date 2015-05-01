<cfcomponent hint="CRUD for the Asset Table" output="false">

	<cffunction name="get" access="public" returntype="query">
		
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
			order by updatedate desc
			
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>


</cfcomponent>