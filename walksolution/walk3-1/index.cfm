
<cfset x = "1">
<cfset y = "2">
<cfset z = x + y>
<cfset z1 = z / 2>
<cfset z2 = z mod 2>

<cfset firstName = "Steve">
<cfset lastName = "Drucker">

<cfset fullName = "#variables.firstName# #variables.lastName#">


<cfsavecontent variable="bio" >
	<cfoutput>
	<h1>About Me</h1>
	<p>This is some content about #variables.fullname#</p>
	</cfoutput>
</cfsavecontent>

<cfoutput>
	 Hello, my name is #variables.fullName#<br />
	 z1: #variables.z1#<br />
	 z2: #variables.z2#<br />
	 #variables.bio#
</cfoutput>