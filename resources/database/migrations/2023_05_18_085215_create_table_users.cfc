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