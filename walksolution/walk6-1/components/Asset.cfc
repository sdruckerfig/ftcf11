<cfcomponent hint="CRUD for the Asset Table" output="false">

	<cffunction name="uploadFile" access="public" roles="admin,superadmin" returntype="string">
		
		<cfset var stData = {}>
		
		<cffile action="upload"
			destination="#application.uploaddir#" 
			filefield="fileupload"
			accept="image/jpg,image/jpeg"
			nameconflict="makeunique" 
			result="stData">
		
		<cfreturn stdata.serverfile>
		
	</cffunction>
	
	<cffunction name="downloadFile" access="remote" returntype="void">
		
			<cfargument name="id" type="numeric" required="true">
			
			<cfset local.qrec = get(id=arguments.id)>
			<cfset local.filespec = application.uploaddir & local.qrec.filename>
			
			<cflog file="downloader" 
			   text="Filespec: #local.qrec.filename#, #local.qrec.recordcount#" 
			   type="information">
			
			<cfheader name="Content-Disposition" value="attachment; filename=#local.qrec.filename#">
			<cfcontent file="#local.filespec#">
			
		
	</cffunction>


	<cffunction name="createRecord" access="public" roles="admin,superadmin" returntype="Numeric">
		
		<cfargument name="title" required="yes" type="string">
		<cfargument name="idCompany" required="yes" type="numeric">
		<cfargument name="description" required="yes" type="string">
		<cfargument name="contentUrl" required="yes" type="string">
		<cfargument name="idAssetType" required="yes" type="numeric">
		<cfargument name="fullContent" required="no" type="string" default="">
		
		<cfif isdefined("form.fileUpload") and form.fileupload is not "">
			<cfset local.filename = uploadFile()>
		<cfelse>
			<cfset local.filename = "">
		</cfif>
		
		<cfquery result="local.stResult">
			insert into Asset (
				filename, title, idCompany, description, contentUrl, idAssetType, fullContent,updateuser, updatedate, begintime
			)
			values (
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.filename#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#" >,
				<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idCompany#" >,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.description#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.contentUrl#">,
				<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idAssetType#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fullContent#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#getAuthUser()#">,
				<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
				<cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">
			)
			
		</cfquery>
		
		<cfreturn local.stResult.generatedKey>
		
	</cffunction>




	<cffunction name="updateRecord" access="public" roles="admin,superadmin" returntype="Numeric">
		
		<cfargument name="id" required="yes" type="numeric">
		<cfargument name="title" required="yes" type="string">
		<cfargument name="idCompany" required="yes" type="numeric">
		<cfargument name="description" required="yes" type="string">
		<cfargument name="contentUrl" required="yes" type="string">
		<cfargument name="idAssetType" required="yes" type="numeric">
		<cfargument name="fullContent" required="no" type="string" default="">
		
		<cfif isdefined("form.fileUpload") and form.fileupload is not "">
			<cfset local.filename = uploadFile()>
		<cfelse>
			<cfset local.filename = "">
		</cfif>
		
		<cfquery result="local.stResult">
			update Asset 
			 set 
			 title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.title#" >,
			 <cfif local.filename is not "">
			 filename = <cfqueryparam cfsqltype="cf_sql_varchar" value="#local.filename#">,
			 </cfif>
			 idCompany = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idCompany#" >,
			 description = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.description#">,
			 contentUrl = 	<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.contentUrl#">,
			 idAssetType = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.idAssetType#">,
			 fullContent = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.fullContent#">,
			 updateuser = <cfqueryparam cfsqltype="cf_sql_varchar" value="#getAuthUser()#">,
			 updatedate = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
			 begintime = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">
		  where id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.id#">
		</cfquery>
		
		<cfreturn arguments.id>
		
	</cffunction>


	<cffunction name="get" access="public" returntype="query">
		<cfargument name="searchterm" required="false" type="string" default="">
		<cfargument name="timespan" default="#createtimespan(0,0,1,0)#">
		<cfargument name="id" type="numeric" required="false" default="-1">
		
		<cfif isdefined("url.init") or trim(arguments.searchterm) is not "" or arguments.id gt 0>
			<cfset arguments.timespan = createtimespan(0,0,0,0)>
		</cfif>
		
		<cfquery name="local.q" cachedwithin="#arguments.timespan#">
			select 	asset.id, 
					asset.title,
					asset.updatedate,
					company.companyName,
					asset.filename,
					assetType.text as assetType,
					asset.idAssetType,
					asset.idCompany,
					asset.description,
					asset.contentUrl,
					asset.fullContent
			from	asset join company
						on asset.idCompany = company.id
					join assetType
						on asset.idAssetType = AssetType.id	
			where 	asset.endtime is null
			
			<cfif arguments.searchterm is not "">
				  and match(title,description,fullContent) against (
				  	<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.searchterm#">
				  )
			</cfif>
			
			<cfif arguments.id gt -1>
				and asset.id = <cfqueryparam 
								cfsqltype="cf_sql_numeric"
								value="#arguments.id#">
			</cfif>
			
			order by updatedate desc
			
		</cfquery>
		
		<cfreturn local.q>
		
	</cffunction>
	
	
	<cffunction name="deleteRecord" access="public" roles="admin,superadmin" returntype="struct">
		<cfargument name="id" type="numeric" required="true">
		
		<cfquery>
			update asset
			set 
			endtime = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">,
			updateuser = <cfqueryparam cfsqltype="cf_sql_varchar" value="#getAuthUser()#">
			where id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.id#">
		</cfquery>
		
		<cfreturn {
			  id =  arguments.id,
			  success = true
		}> 
		
	</cffunction>

	<cffunction name="downloadBioPDFFile" access="remote" returntype="void">
		
			<cfargument name="id" type="numeric" required="true">
			<!--- Grab content to use in generating PDF--->
			<cfset local.qrec = get(id=arguments.id)>
			<!--- Create a filename for the PDF --->
			<cfset local.filespec = application.PDFGenDir & replacenocase(local.qrec.title," ","_","all") & ".pdf">
			<!--- Create a structure to hold data to be passed into cfdocumentitem --->
			<cfset local.stqRec = StructNew()>
			<cfset local.stqRec.Title = local.qrec.title>
			
			<!--- Log each created PDF --->
			<cflog file="biopdfdownloader" 
			   text="Filespec: #local.filespec#" 
			   type="information">
			   
			<!--- Walk 6-1 Part 1 (Generate the tag) --->   
			<!--- Walk 6-1 Part 2 (Add a header and footer)  
			<cfdocument format="PDF" filename="#local.filespec#" overwrite="true">
				<cfdocumentitem type="header" attributecollection="#local.stqRec#">
				<cfoutput><b>#attributes.title#</b></cfoutput>
				</cfdocumentitem>
				<cfdocumentitem type="footer">
					Copyright &copy; Fig Leaf Software
				</cfdocumentitem>
				<cfoutput>#local.qrec.fullContent#</cfoutput>
			</cfdocument>---> 
			
			<!--- Walk 6-1 Part 3 (Create the PDF using CFHTMLTOPDF) --->  
			<cfhtmltopdf destination="#local.filespec#" margintop="1" marginleft=".5" marginright=".5" overwrite="true">
				<cfhtmltopdfitem type="header" marginleft=".6" marginbottom=".5" align="Left" attributecollection="#local.stqRec#">
				  <cfoutput><b>#attributes.title#</b></cfoutput>
				</cfhtmltopdfitem>
				<cfhtmltopdfitem type="footer" marginleft=".5" align="Left">
				    Copyright Fig Leaf Software
				</cfhtmltopdfitem>
				<cfoutput>#local.qrec.fullContent#</cfoutput>
			</cfhtmltopdf>
			
			<!--- Return the newly created PDF --->
			<cfheader name="Content-Disposition" value="attachment; filename=#local.filespec#">
			<cfcontent file="#local.filespec#">
			
		
	</cffunction>

</cfcomponent>

