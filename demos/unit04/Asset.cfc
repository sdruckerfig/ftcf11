<cfcomponent hint="Content Asset Methods and Properties" output="false">

	<cffunction name="getAll" hint="Search all records" access="public" output="false" returntype="query">
		<cfargument name="filter" required="false" type="array" default="[]">
		<cfargument name="sort" required="false" type="array" default="[]">
		<cfargument name="limit" required="false" type="numeric" default="100">
		<cfargument name="start" required="false" type="numeric" default="1">


	</cffunction>
	
	<cffunction name="getDetail" hint="Get a specific record" access="public" output="false" returntype="struct">
		<cfargument name="id" required="true" type="numeric">
		

	</cffunction>
	
	<cffunction name="updateRecord" access="public" returntype="struct" roles="User,Admin,SuperAdmin">

  		<cfargument  name="id" required="yes" type="numeric">

	</cffunction>

</cfcomponent>