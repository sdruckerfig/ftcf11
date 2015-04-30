<cfset myname = "steve O'Drucker">

<cfoutput>
&lt;cfset myname = "steve O'Drucker"&gt;
<table border="1">
<tr>
	<th>Function</th>
	<th>Result</th>
</tr>
<tr>
	<td>chr(65)</td>
	<td>#chr(65)#</td>
</tr>
<tr>
	<td>find("Drucker",myname)</td>
	<td>#find("Drucker",myname)#</td>
</tr>
<tr>
	<td>left(myname,5)</td>
	<td>#left(myname,5)#</td>
</tr>
<tr>
	<td>right(myname,3)</td>
	<td>#right(myname,3)#</td>
</tr>
<tr>
	<td>replace(myname,"O'Drucker","Drucker")</td>
	<td>#replace(myname,"O'Drucker","Drucker")#</td>
</tr>
<tr>
	<td>encrypt(myname, generateSecretKey("AES",128),"AES")</td>
	<td>#encrypt(myname, generateSecretKey("AES",128),"AES")#</td>
</tr>
<tr>
	<td>jsStringFormat(myname)</td>
	<td>#jsStringFormat(myname)#</td>
</tr>
<tr>
	<td>urlEncodedFormat(myname)</td>
	<td>#urlEncodedFormat(myname)#</td>
</tr>
</table>
</cfoutput>



