<cfset cDate = parseDateTime("04/29/2015 13:00")>

<cfoutput>
&lt;cfset cDate = parseDateTime("04/29/2015 13:00")&gt;
<table border="1">
<tr>
	<th>Function</th>
	<th>Result</th>
</tr>
<tr>
	<td>dateFormat(cDate)</td>
	<td>#dateFormat(cDate)#</td>
</tr>
<tr>
	<td>dateFormat(cDate,"MMM, dd YYYY")</td>
	<td>#dateFormat(cDate,"MMM dd, YYYY")#</td>
</tr>
<tr>
	<td>timeFormat(cDate)</td>
	<td>#timeFormat(cDate)#</td>
</tr>
<tr>
	<td>dateAdd('d',cDate,2)</td>
	<td>#dateAdd('d',cDate,2)#</td>
</tr>
<tr>
	<td>dateDiff('d',cDate,dateAdd('YYYY',1,cDate))</td>
	<td>#dateDiff('d',cDate,dateAdd('YYYY',1,cDate))#</td>
</tr>
<tr>
	<td>createTimeSpan(1,1,0,0)</td>
	<td>#createTimeSpan(1,1,0,0)#</td>
</tr>
</table>
</cfoutput>



