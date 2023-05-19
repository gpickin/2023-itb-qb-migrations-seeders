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