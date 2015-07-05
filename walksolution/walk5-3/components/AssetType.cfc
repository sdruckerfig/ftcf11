

<cfcomponent hint="AssetType CRUD" output="false">

	<cffunction name="get" access="public" returntype="query">
		
		<cfquery name="local.q">
			select id,text
			from assetType
			order by text
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>

</cfcomponent>
