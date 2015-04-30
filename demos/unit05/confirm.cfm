
<cfquery datasource="ProposalManager" name="q">
	select *
	from company
	where endtime is null
</cfquery>

<html>
	<head>
		<script type="text/javascript">
			function confirmDelete(id,label) {
				if (confirm("Delete " + label + "?")) {
					location.href=location.href + "?action=delete&id=" + id;
				}
			}
		</script>
	</head>
	<body>
		<table border="1">
			<tr>
			<th>Company</th>
			<th>Del</th>
			</tr>
			
			<cfoutput query="q">
				<tr>
				<td>#q.companyName#</td>
				<td>
					<a href="javascript:confirmDelete(#q.id#,'#jsStringFormat(q.companyName)#')">Delete</a>
				</td>
				</tr>
			</cfoutput>
		</table>
	</body>
</html>
