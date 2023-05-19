component {

	property name="qb" inject="provider:queryBuilder@qb";
	property name="mssqlqb" inject="provider:mssqlqb";

	function preHandler( event, rc, prc ){
		prc.qb = qb;
		prc.mssqlqb = mssqlqb;
	}

	function listUsers( event, rc, prc ){}
	function paginateUsers( event, rc, prc ){}
	function activeUsers( event, rc, prc ){}
	function inactiveUsers( event, rc, prc ){}
	function getUser( event, rc, prc ){}
	function filterUsers( event, rc, prc ){
		param name="rc.firstName" default="";
		param name="rc.lastName" default="";
		param name="rc.email" default="";
		param name="rc.isActive" default="all";
	}
}