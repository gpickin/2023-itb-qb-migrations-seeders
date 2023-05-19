<h3>
	<a href="/cfmigrations/index.cfm">Home</a> :
	Alter Users Table</h3>

<h5>Create a Migration file</h5>

<pre>
migrate create alter_table_users_add_column_photo
Created D:\D_drive\www\itb\qb\resources\database\migrations\2023_05_18_085601_alter_table_users_add_column_photo.cfc
</pre>

<h5>Migration Code</h5>
<pre>
component {

	function up( schema, qb ) {
		schema.alter( "users", function( table ) {
			table.addColumn( table.boolean( "is_active" ).default( true ) );
			table.index( [ "is_active" ], "idx_users_is_active" );
		} );
	}

	function down( schema, qb ) {
		schema.alter( "users", function( table ) {
			table.dropColumn( "is_active" );
		} );
	}

}

</pre>