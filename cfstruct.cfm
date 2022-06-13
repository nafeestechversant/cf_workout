<!---Step 1 - Create a structure using the structNew() function--->
<cfset stUser = structNew() />
<cfset stUser.firstName = "Nafees">
<cfset stUser.lastName = "Rahman">
<cfset stUser.age = "24">
<cfdump  var="#stUser#" label="explicit Structure">

<!---Step 2 - Create the same structure using implicit notation--->
<cfset stImplicit = {firstName='Nafees',lastName='Rahman',age='25'}>
<cfdump  var="#stImplicit#" label="implicit Structure">
<!---Step 3 - use structDelete() --->
<cfset structDelete(stUser, "age")>
<cfdump  var="#stUser#" label="after age delete">
<cfset structClear(stUser)>
<cfdump  var="#stUser#" label="after clear">
<cfoutput>Count of Elements #structCount(stImplicit)#
</cfoutput>