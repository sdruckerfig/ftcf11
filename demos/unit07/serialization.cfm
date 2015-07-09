<cfset mystruct = {
	firstName: 'Steve',
	lastName: 'Drucker'
}>

<cfoutput>#serializeJSON(variables.mystruct)#</cfoutput>

<cfset mystruct = {
	"firstName": 'Steve',
	"lastName": 'Drucker'
}>

<cfoutput>#serializeJSON(variables.mystruct)#</cfoutput>

<!--- output:
{"FIRSTNAME":"Steve","LASTNAME":"Drucker"}
--->