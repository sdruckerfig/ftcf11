<cfinvoke 
    component = "Auth"
    method = "authenticate"
    returnVariable = "bLogin">
    
    <cfinvokeargument name="username" value="sdrucker">
    <cfinvokeargument name="password" value="figleaf">
    
    
</cfinvoke>

<cfoutput>#variables.bLogin#</cfoutput>