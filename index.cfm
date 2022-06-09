<cfscript>
	// Default our URL parameters for easier consumption.
	param name="url.startSession" type="boolean" default=false;
	param name="url.stopSession" type="boolean" default=false;
	// In this demo, we're dynamically enabling / disabling the ColdFusion Session based
	// on the presence of a Cookie. As such, if we want to bind the session to the current
	// request, we have to set the flag cookie (session will be attached on NEXT request).
	if ( url.startSession ) {
		cookie.enableSession = true;
	// ... and, if we don't want to bind the session to the current request, we have to
	// delete the cookie (session will be detached on NEXT request).
	} else if ( url.stopSession ) {
		cookie.delete( "enableSession" );
	}
	// If we're changing the session settings in either direction, let's refresh the page
	// to apply the new cookie-based settings for the demo (just so we can immediately
	// see the differences in the rendering down below).
	if ( url.startSession || url.stopSession ) {
		location( url = cgi.script_name, addToken = false );
	}
</cfscript>
<cfoutput>

	<h1>
		Conditional ColdFusion Session Testing
	</h1>

	<p>
		Sessions enabled:
		#yesNoFormat( getApplicationMetadata().sessionManagement )#
	</p>

	<cfif request.isSessionEnabled>
		<p>
			<strong>Hit count:</strong> #session.requestCount#
		</p>
	</cfif>

	<p>
		<a href="#cgi.script_name#?startSession=true">Start session</a> ,
		<a href="#cgi.script_name#?stopSession=true">Stop session</a> ,
		<a href="#cgi.script_name#?_=#createUniqueID()#">Refresh</a>
	</p>

</cfoutput>