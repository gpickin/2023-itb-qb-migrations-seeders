<cfoutput>
	<h3>
		<a href="/qb/index.cfm">Home</a> :
		Filter Users</h3>

		<hr>

	<h5>Filter Users Form</h5>

	<cfform method="post" action="/qb/filterUsers">
		<div class="row">
			<div class="col-3 py-1"><label for="firstName">First Name:</label></div>
			<div class="col-9 py-1">
				<cfinput type="text" name="firstName" id="firstName" value="#rc.firstName#" />
			</div>
		</div>
		<div class="row">
			<div class="col-3 py-1"><label for="lastName">Last Name:</label></div>
			<div class="col-9 py-1">
				<cfinput type="text" name="lastName" id="lastName" value="#rc.lastName#" />
			</div>
		</div>
		<div class="row">
			<div class="col-3 py-1"><label for="email">Email:</label></div>
			<div class="col-9 py-1">
				<cfinput type="text" name="email" id="email" value="#rc.email#" />
			</div>
		</div>
		<div class="row">
			<div class="col-3 py-1"><label for="Active">Is Active?:</label></div>
			<div class="col-9 py-1">
				<select name="isActive">
					<option value="all" <cfif rc.isActive == "all">selected</cfif>>All Users - Active and Inactive</option>
					<option value="1" <cfif rc.isActive == "1">selected</cfif>>Only Active Users</option>
					<option value="0" <cfif rc.isActive == "0">selected</cfif>>Only Inactive Users</option>
				</select>
			</div>
		</div>
		<input type="submit" value="Filter Users" class="btn btn-primary" />
	</cfform>

	<hr>

	<h5>queryExecute</h5>
<pre>
sql = "SELECT *";
if( rc.isActive.len() && rc.isActive != "all" ){
	sql = sql & ", 'Active' as isActive";
}
sql = sql & " FROM `users` WHERE 1=1 ";
if( rc.firstName.len() ){
	sql = sql & " AND `firstName` LIKE ?";
}
if( rc.lastName.len() ){
	sql = sql & " AND `lastName` LIKE ?";
 }
if( rc.email.len() ){
	sql = sql & " AND `email` LIKE ?";
}
if( rc.email.len() ){
	sql = sql & " AND `is_active` = ?";
}
if( rc.firstName.len() || rc.lastName.len() ){
	sql = sql & " ORDER BY ";
}
if( rc.firstName.len() ){
	sql = sql & " `firstName` DESC";
}
if( rc.lastName.len() ){
	sql = sql & " `lastName` DESC";
}
sql = sql & "LIMIT 25 OFFSET 0";
sqlParams = [];
if( rc.firstName.len() ){
	arrayAppend( sqlParams, { value:"%##rc.firstName##%" } );
}
if( rc.lastName.len() ){
	arrayAppend( sqlParams, { value:"%##rc.lastName##%" } );
}
if( rc.email.len() ){
	arrayAppend( sqlParams, { value:"%##rc.email##%" } );
}
if( rc.isActive.len() && rc.isActive != "all" ){
	arrayAppend( sqlParams, { value:rc.isActive, cfsqltype="cf_sql_numeric" } );
}
results = queryExecute( sql, sqlParams, { returntype="array" } );
</pre>

	<cfset prc.qb = filterUsers( prc.qb.table( "users" ), rc )>
	<cfset prc.mssqlqb = filterUsers( prc.mssqlqb.table( "users" ), rc )>

	<h5>QB Code</h5>

	<pre>
&lt;cfset prc.qb = filterUsers( prc.qb.table( &quot;users&quot; ), rc )&gt;
&lt;cfset prc.mssqlqb = filterUsers( prc.mssqlqb.table( &quot;users&quot; ), rc )&gt;


&lt;cffunction name=&quot;filterUsers&quot;&gt;
	&lt;cfargument name=&quot;qb&quot; required /&gt;
	&lt;cfargument name=&quot;rc&quot; required /&gt;

	&lt;cfreturn arguments.qb.when( rc.firstName.len(), function(q){
		q.whereLike( &quot;firstName&quot;, &quot;%##rc.firstName##%&quot; )
			.orderBy( &quot;firstName&quot; )
	})
	.when( rc.lastName.len(), function(q){
		q.whereLike( &quot;lastName&quot;, &quot;%##rc.lastName##%&quot; )
			.orderBy( &quot;lastName&quot;, &quot;desc&quot; )
	})
	.when( rc.email.len(), function(q){
		q.whereLike( &quot;email&quot;, &quot;%##rc.email##%&quot; )
	})
	.when( rc.isActive.len() &amp;&amp; rc.isActive != &quot;all&quot;, function(q){
		q.where( &quot;is_active&quot;, rc.isActive )
			.selectRaw( &quot;*, &##39;Active&##39; as isActive&quot; )
	})
	.forPage( 1, 25 )&gt;
&lt;/cffunction&gt;

	</pre>


	<hr>

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


<cffunction name="filterUsers">
	<cfargument name="qb" required />
	<cfargument name="rc" required />

	<cfreturn arguments.qb.when( rc.firstName.len(), function(q){
		q.whereLike( "firstName", "%#rc.firstName#%" )
			.orderBy( "firstName" )
	})
	.when( rc.lastName.len(), function(q){
		q.whereLike( "lastName", "%#rc.lastName#%" )
			.orderBy( "lastName", "desc" )
	})
	.when( rc.email.len(), function(q){
		q.whereLike( "email", "%#rc.email#%" )
	})
	.when( rc.isActive.len() && rc.isActive != "all", function(q){
		q.where( "is_active", rc.isActive )
			.selectRaw( "*, 'Active' as isActive" )
	})
	.forPage( 1, 25 )>
</cffunction>