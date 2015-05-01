<cfset Kardashians = [
  {firstName = "Khloe", lastName = "Kardashian"},
  {firstName = "Kourtney", lastName = "Kardashian"},
  {firstName = "Kim", lastName = "Kardashian"}
]>

<!---
<cfdump var="#variables.Kardashians#">
--->

<cfset Druckers = duplicate(Kardashians)>

<cfset Druckers[2].lastName = "Drucker">

<cfdump var="#variables.Druckers#">
<cfdump var="#variables.Kardashians#">

<cfset Kardashians[3].salary = randrange(237823,478733)>

<cfoutput>
	<cfset kSister = variables.Kardashians[3]>
	#variables.kSister.firstName# #variables.kSister.lastName# 
	earned #dollarformat(variables.kSister.salary)# on #dateFormat(now(),"mmmm dd, yyyy")#
</cfoutput>

