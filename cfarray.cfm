<!---Step 1 - Create an array using explicit notation--->

<cfset faq = ArrayNew(1)>
<cfset ArrayAppend(faq, "What are ColdFusion arrays")>
<cfset ArrayAppend(faq, "How to create a ColdFusion array?")>
<cfset ArrayAppend(faq, "What are two dimensional arrays?")>

<cfoutput>#faq[2]#</cfoutput><br />
<cfoutput>#faq[3]#</cfoutput><br />
<cfoutput>#ArrayToList(faq)#</cfoutput>
<!---Step 2 - Create an array using the implicit array notation--->
<cfset faqImplicit = ['Red','Blue','Orange']>
<cfdump  var="#faqImplicit#" label="Implicit array">
<!---Step 3 - use arrayLen()--->
    
<cfoutput>Array Length #arrayLen(faqImplicit)#<br />
</cfoutput>

<!---Step 4 - use <cfloop> to loop over the array--->

<cfoutput>
<cfloop from="1" to="#arrayLen(faqImplicit)#" index="i">
#i# = #faqImplicit[i]#<br />
</cfloop>
</cfoutput>

<cfset arrayAppend(faqImplicit, "Yellow") />
<cfset arrayPrepend(faqImplicit, "Black")>
<cfdump  var="#faqImplicit#" label="after prepend and append">
<cfset arrayDeleteAt(faqImplicit, 2)>
<cfdump  var="#faqImplicit#" label="after delete">