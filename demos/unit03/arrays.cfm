<!--- use the ArrayNew() function --->

<cfset a = arrayNew(1)>

<!--- or use the shorthand syntax --->

<cfset a = [ ] >

<!--- arrays can be prepopulated --->

<cfset a = ['a','b','c','d',24,74]>

<!--- arrays can contain nested arrays ---->

<cfset a = []>
<cfset a[1] = ['a','b','c']>
<cfset a[2] = ['d','e','f']>
<cfoutput>
	#a[2][2]#
</cfoutput>