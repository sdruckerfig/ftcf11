<cfcomponent extends="CFIDE.websocket.ChannelListener">
 <cffunction name="beforePublish" access="public">
   <cfargument name="message" type="any">
   <cfargument name="publisherInfo" type="struct">
        
 	<cfset local.time = timeformat(now())>
    <cfset local.message  = local.time & ": " & message>
           
   <cfreturn local.message>
  </cffunction>
</cfcomponent>