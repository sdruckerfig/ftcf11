<hr>
<cfset today = now()>

<cfset r = randrange(0,255)>
<cfset g = randrange(0,255)>
<cfset b = randrange(0,255)>

<cfoutput>
	<div style="color:rgb(#variables.r#,#variables.g#,#variables.b#)">
	Copyright &copy; #year(variables.today)#. All rights reserved
	</div>
</cfoutput>

</body>
</html>

