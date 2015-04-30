<cfset myAge = "45">

<cfoutput>
&lt;cfset myage = "45"&gt;
<table border="1">
<tr>
	<th>Function</th>
	<th>Result</th>
</tr>
<tr>
	<td>dollarformat(myage)</td>
	<td>#dollarformat(myage)#</td>
</tr>
<tr>
	<td>numberformat(myage,"0.0")</td>
	<td>#numberformat(myage,"0.0")#</td>
</tr>
<tr>
	<td>abs(-1)</td>
	<td>#abs(-1)#</td>
</tr>
<tr>
	<td>max(20,30)</td>
	<td>#max(20,30)#</td>
</tr>
<tr>
	<td>pi()</td>
	<td>#pi()#</td>
</tr>
<tr>
	<td>randrange(1,5)</td>
	<td>#randrange(1,5)#</td>
</tr>
<tr>
	<td>round(23.4)</td>
	<td>#round(23.4)#</td>
</tr>
<tr>
	<td>sqr(myage)</td>
	<td>#sqr(myage)#</td>
</tr>
</table>
</cfoutput>



