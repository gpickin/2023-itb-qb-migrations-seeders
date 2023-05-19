component {

    function up( schema, qb ) {
        schema.alter( "users", function( table ) {
            table.addColumn( table.boolean( "is_active" ).default( true ) );
            table.index( [ "is_active" ], "idx_users_is_active" );
        } );
    }

    function down( schema, qb ) {
        schema.alter( "users", function( table ) {
            table.dropConstraint( "df_users_is_active" );
			table.dropColumn( "is_active" );
        } );
    }

}
