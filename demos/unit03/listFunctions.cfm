<cfset lNames = "Steve,Aidan,Dylan,Mary Ann">

<cfoutput>
&lt;cfset lNames = "Steve,Aidan,Dylan,Mary Ann" &gt;
<table border="1">
<tr>
	<th>Function</th>
	<th>Result</th>
</tr>
<tr>
	<td>listFirst(lNames)</td>
	<td>#listFirst(lNames)#</td>
</tr>
<tr>
	<td>listLast(lNames)</td>
	<td>#listLast(lNames)#</td>
</tr>
<tr>
	<td>listGetAt(lNames,2)</td>
	<td>#listGetAt(lNames,2)#</td>
</tr>
<tr>
	<td>listQualify(lNames,"'")</td>
	<td>#listQualify(lNames,"'")#</td>
</tr>
<tr>
	<td>listFindNoCase(lNames,"steve")</td>
	<td>#listFindNoCase(lNames,"steve")#</td>
</tr>
<tr>
	<td>listLen(lNames)</td>
	<td>#listLen(lNames)#</td>
</tr>
</table>
</cfoutput>



