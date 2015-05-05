<!---
File   : index.cfm
Purpose: Endpoint for application
By     : Steve Drucker
Created: 04/17/2015

Usage:
Direct invocation

Modification Log:
Date        Action
=============================================
04/18/2015  Created
--->

<cfinclude template="includes/functions.cfm">

<cfset pageTitle = "Welcome to Proposal Manager">

<cfinclude template="includes/header.cfm">

<cfoutput>
Your random password is: #generatePassword(10)# <br />
#abbreviate("And this is a big block of text",12)#
</cfoutput>

<cfinclude template="includes/footer.cfm">
