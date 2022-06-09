component
	output = false
	hint = "I define the application settings and event-handlers."
	{

	// Define the core settings.
	this.name = "ConditionalSessionTest";
	this.applicationTimeout = createTimeSpan( 1, 0, 0, 0 );
    this.sessionManagement = "yes"; 

	// In this demo, we're dynamically attaching / detaching the SESSION SCOPE to the
	// current request. This is based on the existence of a "flag" cookie. One of the most
	// fascinating things about ColdFusion is that basically all of the settings can be
	// adjusted on a PER-REQUEST basis; including session management.
	if ( cookie.keyExists( "enableSession" ) ) {

		this.sessionManagement = true;
		this.setClientCookies = true;
		this.sessionTimeout = createTimeSpan( 0, 0, 10, 0 );

	} else {

		this.sessionManagement = false;
		this.setClientCookies = false;

	}

	// ---
	// PUBLIC METHODS.
	// ---

	/**
	* I get called once to initialize the session associated with the request.
	*/
	public void function onSessionStart() {

		session.requestCount = 0;

	}


	/**
	* I get called once to initialize the request.
	*/
	public void function onRequestStart() {

		// If the SESSION is not enabled for the current request, the SESSION SCOPE is
		// undefined. As such, we would have to take care to test for its existence before
		// we reference it.
		request.isSessionEnabled = isDefined( "session" );

		if ( request.isSessionEnabled ) {

			session.requestCount++;

		}

	}

}