<cfset nav = [
   {
  	 label = "Content Assets",
  	 url = "assets/assets.cfm",
  	 roles = ""
   },
   {
   	 label = "Companies",
   	 url = "admin/companies.cfm",
   	 roles = "admin"
   },
   {
   	 label="Logout",
   	 url = "login/logout.cfm",
   	 roles = ""
   }
]>


<doctype html>
<html>
	<head>
		<title></title>
		<style>
			nav {
				height: 25px;
				background-color: silver;
			}
			
			nav > span {
				display: inline-block;
				text-align: center;
				width: 125px;
				height: 23px;
				border: 1px solid black;
				float: right;
			}
			
			label {
				display: block;
				width: 100px;
				float: left;
			}
			
			br {
				clear: all;
			}
		</style>
	</head>
	<body>
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
		
		
	