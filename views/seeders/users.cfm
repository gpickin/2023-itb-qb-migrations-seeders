<h3>
	<a href="/seeders/index.cfm">Home</a> :
	Seed Users</h3>

<h5>Create a seed file</h5>

<pre>
migrate seed create seed_users
Created D:\www\itb\qb\resources\database\seeds\seed_users.cfc
</pre>

<h5>Seed Code</h5>
<pre>
component {
	function run( qb, mockdata ) {
		qb.table( "users" ).insert(
			mockdata.mock(
				$num = 250,
				"firstName": "fname",
				"lastName": "lname",
				"email": "email",
				"password": "string-secure",
				"is_active": "num:0:1"
			)
		);
	}
}
</pre>