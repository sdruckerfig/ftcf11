<html>
	<head><title>Structure Functions</title></head>
	<body>
		<cfset stData = {
			'fName': 'Steve',
			'lName': 'Drucekr'
		}>

<cfoutput>
&lt;cfset stData = {'fName': 'Steve', 'lName': 'Drucker'}&gt;
<table border="1">
<tr>
	<th>Function</th>
	<th>Result</th>
</tr>
<tr>
	<td>structKeyExists(stData,'fName')</td>
	<td>#structKeyExists(stData,'fName')#</td>
</tr>
<tr>
	<td>structDelete(stData,'fName')</td>
	<td>#structDelete(stData,'fName')#</td>
</tr>
<tr>
	<td>structKeyExists(stData,'fName')</td>
	<td>#structKeyExists(stData,'fName')#</td>
</tr>
<tr>
	<td>stdata.lName</td>
	<td>#stData.lName#</td>
</tr>
<tr>
	<td>structClear(stData)</td>
	<td>#structClear(stData)#</td>
</tr>
<tr>
	<td>structKeyList(stData)</td>
	<td>#structKeyList(stData)#</td>
</tr>


</table>
</cfoutput>
	</body>
</html>