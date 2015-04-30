
<html>
	<head><title></title></head>
	<body>
		
		<cfset qSize = queryNew("id,size")>
		<cfset queryAddRow(qSize,2)>
		<cfset querySetCell(qSize,"id",1,1)>
		<cfset querySetCell(qSize,"size","1-10",1)>
		<cfset querySetCell(qSize,"id",2,2)>
		<cfset querySetCell(qSize,"size","11-20",2)>
		
		<cfset defaultValue = 2>
		<cfform>
			<cfselect
			   name="companySizeId" 
			   query="qSize"
			   value="id"
			   display="size"
			   selected="#variables.defaultValue#" 
			   queryPosition="below">
				<option value="">Please Select</option>
			</cfselect>
			   
		</cfform>
		
		
	</body>
</html>