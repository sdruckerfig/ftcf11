<cfset aData = ['Kirk','Spock','McCoy','Scotty']>

<cfoutput>
&lt;cfset aData = ['Kirk','Spock','McCoy','Scotty'] &gt;
<table border="1">
<tr>
	<th>Function</th>
	<th>Result</th>
</tr>
<tr>
	<td>arrayLen(aData)</td>
	<td>#arrayLen(aData)#</td>
</tr>
<tr>
	<td>arrayDeleteAt(aData,2)</td>
	<td>#arrayDeleteAt(aData,2)#</td>
</tr>
<tr>
	<td>arrayContains(aData,'Scotty')</td>
	<td>#arrayContains(aData,'Scotty')#</td>
</tr>
<tr>
	<td>arrayToList(aData)</td>
	<td>#arrayToList(aData)#</td>
</tr>
</table>
</cfoutput>



