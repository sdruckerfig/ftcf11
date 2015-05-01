<cfcomponent rest="true" restpath="assets" extends="Asset">

	<cffunction name="getAssets" httpmethod="get" returntype="query" access="remote" >
		
		
		<cfquery name="local.q" result="local.stresult">
			select 	asset.id, 
					asset.title,
					asset.updatedate,
					company.companyName,
					assetType.text as assetType,
					asset.idAssetType,
					asset.description,
					asset.idCompany,
					asset.contentUrl,
					filename
			from	asset join company
						on asset.idCompany = company.id
					join assetType
						on asset.idAssetType = AssetType.id	
			where 	asset.endtime is null
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>


</cfcomponent>