<?php 
class Model_User extends Model_Base {
	
	protected $table = 'users';
	
	function getByAccount($account) {
		$query = DB::query(Database::SELECT, 'SELECT * FROM users WHERE account = :account limit 1');
		$query->param(':account', $account);
		$results = $query->execute();
		return $results->current();
	}
	
	function get_user_auth_list($id) {
		$sql = <<<SQL
SELECT a.*, ra.role_id, ra.auth_id
FROM roles r, user_role ur, role_auth ra, auths a
WHERE ur.role_id=r.id and ra.role_id=r.id and a.id=ra.auth_id and ur.user_id= :user_id
SQL;
		$query = DB::query(Database::SELECT, $sql);
		$query->param(':user_id', $id);
		$results = $query->execute();
		return $results;
	}
	
	function get_user_roles($id) {
		$sql = <<<SQL
select r.*
from users u, roles r, user_role ur
where u.id=ur.user_id and r.id=ur.role_id and u.id=:user_id
SQL;
		$query = DB::query(Database::SELECT, $sql);
		$query->param(':user_id', $id);
		$results = $query->execute();
		return $results;
	}
}