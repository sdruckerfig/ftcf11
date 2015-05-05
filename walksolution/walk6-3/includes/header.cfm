<cfset nav = [
 	{
   	 label="Logout",
   	 url = "login/logout.cfm",
   	 roles = ""
   },
   {
   	 label = "Companies",
   	 url = "admin/companies.cfm",
   	 roles = "admin"
   },
   {
  	 label = "Content Assets",
  	 url = "assets/assets.cfm",
  	 roles = ""
   }
]>


<doctype html>
<html>
	<head>
		<title></title>
		<link rel="stylesheet" 
			  type="text/css" 
			  href="/ftcf11/shared/css/Application.css" />
	</head>
	<body>
		<header>
		<h1>Proposal Manager</h1>
		<nav>
			<cfoutput>
			<cfloop array="#variables.nav#" index="thisLink">
				<span onclick="location.href='#application.basehref##thislink.url#'">
					#thislink.label#
				</span>
			</cfloop>
			</cfoutput>
		</nav>
		</header>
		
		
	