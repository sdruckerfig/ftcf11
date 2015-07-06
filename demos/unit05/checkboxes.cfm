<!--- create query object --->
<cfset qSize = queryNew("id,size")>
<cfset queryAddRow(qSize,2)>
<cfset querySetCell(qSize,"id",1,1)>
<cfset querySetCell(qSize,"size","1-10",1)>
<cfset querySetCell(qSize,"id",2,2)>
<cfset querySetCell(qSize,"size","11-20",2)>

<cfset defaultValue = 2>

<cfform>
	
	<cfoutput query="qSize">
		<cfinput 
		 type="radio" 
		 name="size" 
		 value="#qSize.id#"
		 checked="#iif(qsize.id is defaultvalue,true,false)#">#qSize.size#<br />
	</cfoutput>
	   
</cfform>