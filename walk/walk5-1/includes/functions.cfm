
<cffunction name="generatePassword" returntype="string" hint="Generate a 5 character random password">
	<cfargument name="numchars" required="false" default="5">
		
	<cfset local.password = "">
	<cfloop from="1" to="#arguments.numchars#" index="local.i">
		<cfset local.password = local.password & chr(randrange(65,90)) >
	</cfloop>
	
	<cfreturn lcase(local.password)>

</cffunction>


<!--- unit test 

<cfoutput>
	The password is #generatePassword(10)#
</cfoutput>

--->


<cfscript>
	
	/**
 * Abbreviates a given string to roughly the given length, stripping any tags, making sure the ending doesn't chop a word in two, and adding an ellipsis character at the end.
 * Fix by Patrick McElhaney
 * v3 by Ken Fricklas kenf@accessnet.net, takes care of too many spaces in text.
 * 
 * @param string 	 String to use. (Required)
 * @param len 	 Length to use. (Required)
 * @return Returns a string. 
 * @author Gyrus (gyrus@norlonto.net) 
 * @version 3, September 6, 2005 
 */
function abbreviate(string,len) {
	var newString = REReplace(string, "<[^>]*>", " ", "ALL");
	var lastSpace = 0;
	newString = REReplace(newString, " \s*", " ", "ALL");
	if (len(newString) gt len) {
		newString = left(newString, len-2);
		lastSpace = find(" ", reverse(newString));
		lastSpace = len(newString) - lastSpace;
		newString = left(newString, lastSpace) & "  &##8230;";
	}	
	return newString;
}
	
</cfscript>


<!---
 unit test
 
<cfoutput>
	#abbreviate("These are the voyages of the Starship Enterprise", 25)#
</cfoutput>
--->




