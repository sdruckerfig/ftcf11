<cfcomponent hint="Company Table CRUD" output="false">

	<cffunction name="get" access="public" returntype="query">
		
		<cfquery name="local.q">
			select *
			from company
			where endtime is null
			order by companyName
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>


</cfcomponent>