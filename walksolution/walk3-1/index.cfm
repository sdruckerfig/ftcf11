
<cfset variables.x = "4">
<cfset variables.y = "1">
<cfset variables.z = variables.x & variables.y>
<cfset variables.z++>

<cfoutput>
	The answer to life, the universe, and everything is #variables.z#
</cfoutput>

<cfset firstName = "Steve">
<cfset lastName = "Drucker">

<cfset fullName = "#variables.firstName# #variables.lastName#">

<cfsavecontent variable="bio">
 <cfoutput>
 <h2>About Me</h2>
 <p>This is the story of #variables.fullname#</p>
 </cfoutput>
</cfsavecontent>

<cfoutput>
<h1>#variables.fullname#</h1>
<p>I have scientifically determined that:</p>
<ul>
<li>x = #variables.x#</li>
<li>y = #variables.y#</li>
<li>The answer to everything is #variables.z#</li>
</ul>
#variables.bio#
</cfoutput>