<cfquery name="local.q" datasource="ProposalManager">
  select id, companyname from Company
</cfquery>

<cfset sObj = spreadsheetNew()>

<!--- set title in row 2, column 1 --->
<cfset spreadsheetSetCellValue(sObj,"Companies as of #dateformat(now())#",2,1)> 

<!--- loop through query, populating cells --->
<cfloop query="local.q">
 <cfset spreadsheetSetCellValue(sObj,
    local.q.id,
    local.q.currentrow + 2,
    1)>
 <cfset spreadsheetSetCellValue(sObj,
    local.q.companyname,
    local.q.currentrow + 2,
    2)>
 <cfset spreadsheetSetCellValue(sObj,
    randrange(0,1000),
    local.q.currentrow + 2,
    3)>
</cfloop>

<cfset spreadsheetSetCellValue(sObj,
    "Total:",
    local.q.recordcount + 4,
    2)>

<cfset SpreadsheetSetCellFormula(
  sObj, 
  "SUM(C3:C#local.q.recordcount + 2#)", 
  local.q.recordcount + 4, 
  3
)>

<cfspreadsheet
 action="write"
 overwrite="true"
 filename="foo.xls"
 name="sObj" />
