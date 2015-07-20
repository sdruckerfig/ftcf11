<cfcomponent hint="Shared utilities" output="false">

	<cffunction name="generatePassword" returntype="string" hint="Generate a 5 character random password">
		<cfargument name="numchars" required="false" default="5">
			
		<cfset local.password = "">
		<cfloop from="1" to="#arguments.numchars#" index="local.i">
			<cfset local.password = local.password & chr(randrange(65,90)) >
		</cfloop>
		
		<cfreturn lcase(local.password)>
	
	</cffunction>


</cfcomponent>