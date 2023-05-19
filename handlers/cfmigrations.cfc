component {
	function run( qb, mockdata ) {
		qb.table( "users" ).insert(
			mockdata.mock(
				$num = 25,
				"firstName": "firstName",
				"lastName": "lastName",
				"email": "email",
				"password": "string-secure"
			)
		);
	}
}