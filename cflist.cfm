<cfset coldfusion_list = "Lists,Arrays,Structures">
<cfloop list="#coldfusion_list#" index="i">
	<cfoutput> #i#</cfoutput><br />
</cfloop>
<cfoutput>#listLen(coldfusion_list)#</cfoutput><br />
<cfloop list="#coldfusion_list#" index="i">
	<cfoutput> #i#</cfoutput><br />
</cfloop>

<cfloop list="#coldfusion_list#" index="i">
	<cfoutput> #i#</cfoutput><br />
</cfloop>

<p><cfoutput>
   #DateFormat(Now(), "ddd dd mmmm, yyyy")#
</cfoutput></p>

<p><cfscript>
someArray = [1,2,3,4];
someList = arrayToList(someArray,"|");
writeOutput(someList);
</cfscript></p>
<p><cfscript>
list = "coldfusion;php;java;sql";
getArray = listToArray(list,";");
someJSON = serializeJSON(getArray);
writeOutput(someJSON);
</cfscript></p>