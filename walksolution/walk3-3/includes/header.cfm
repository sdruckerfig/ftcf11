<!---
File   : header.cfm
Purpose: Navigation control
By     : Steve Drucker
Created: 04/17/2015

Usage:
Invoke at the top of a CFM by using <cfinclude>

Modification Log:
Date        Action
=============================================
04/18/2015  Created
--->

<cfset nav = [
   {
  	 label = "Logout",
  	 url = "login/logout.cfm",
  	 roles = ""
   },
   {
   	 label = "Companies",
   	 url = "admin/companies.cfm",
   	 roles = "admin"
   },
   {
   	 label="Content Assets",
   	 url = "admin/Asset.cfm",
   	 roles = ""
   },
   {
     label="Home",
     url = "/index.cfm",
     roles = ""
   }
]>



<cfparam name="pageName" default="Proposal Manager">

<doctype html>
<html>
	<head>
	<title>
     <!--- insert dynamic title here --->
     <cfoutput>#variables.pageName#</cfoutput>
   </title>
   <link rel="stylesheet" type="text/css" 
	     href="/ftcf11/shared/css/Application.css" />
	</head>
	<body>
   <!-- app menu will go here -->
   
   <!---
   <cfdump var="#variables.nav#">
   --->
