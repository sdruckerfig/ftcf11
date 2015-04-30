<html>
<head>
<body>

<cfset myName = "Steve Drucker">

<cfset firstName = variables.myName.listGetAt(1," ")>
<cfset lastName =   variables.myName.listGetAt(2," ")>
<cfset email = variables.firstName.left(1) & variables.lastName & "@figleaf.com">

<cfoutput>#email#</cfoutput>

</body>
</html>


