<h3>
	<a href="/cfmigrations/index.cfm">Home</a> :
	Create a Table - Users</h3>

<h5>Create a Migration file</h5>

<pre>
migrate create create_table_users
Created D:\www\itb\qb\resources\database\migrations\2023_05_18_085215_create_table_users.cfc
</pre>

<h5>Migration Code</h5>
<pre>
component {

	function up( schema, qb ) {
		schema.create( "users", function( t ) {
			t.bigIncrements( "id" );
			t.string( "firstName" );
			t.string( "lastName" );
			t.string( "email", 255 ).nullable();
			t.string( "password" ).default( "topsecret" );
		} );
	}

	function down( schema, qb ) {
		schema.dropIfExists( "users" );
	}

}
</pre>