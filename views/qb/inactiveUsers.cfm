<cfoutput>
	<h3>
		<a href="/qb/index.cfm">Home</a> :
		Inactive Users</h3>

	<cfset prc.qb = prc.qb.table( "users" ).forPage( 1, 25 ).where( "is_active", false)>
	<cfset prc.mssqlqb = prc.mssqlqb.table( "users" ).forPage( 1, 25 ).whereIs_Active(0)>
	<h5>QB Code</h5>

	<pre>
&lt;cfset prc.qb = prc.qb.table( &quot;users&quot; ).forPage( 1, 25 ).where( &quot;is_active&quot;, false)&gt;
&lt;cfset prc.mssqlqb = prc.mssqlqb.table( &quot;users&quot; ).forPage( 1, 25 ).whereIs_Active(0)&gt;
	</pre>

	<div class="row">
	<div class="col-6">
	<h5>MySQL Code</h5>

	<h6>ToSQL()</h6>
	<pre>
	#prc.qb.toSQL()#
	</pre>

	<h6>ToSQL( showBindings=true )</h6>
	<pre>
	#prc.qb.toSQL(showBindings=true)#
	</pre>

	<h6>ToSQL( showBindings="inline" )</h5>
	<pre>#prc.qb.toSQL(showBindings="inline")#</pre>

	<h5>Results</h5>

	<cfset results = prc.qb.get()>

	<cfdump var="#results#" />

	</div>
	<div class="col-6">
	<h5>MS SQL Code</h5>

	<h6>MS SQL ToSQL()</h6>
	<pre>
	#prc.mssqlqb.toSQL()#
	</pre>

	<h6>MS SQL ToSQL( showBindings=true )</h6>
	<pre>
	#prc.mssqlqb.toSQL(showBindings=true)#
	</pre>

	<h6>MS SQL ToSQL( showBindings="inline" )</h5>
	<pre>#prc.mssqlqb.toSQL(showBindings="inline")#</pre>

	<h5>Results</h5>

	<cfset results2 = prc.mssqlqb.get()>
	<cfdump var="#results2#" />

	</div>
	</div>
	</cfoutput>