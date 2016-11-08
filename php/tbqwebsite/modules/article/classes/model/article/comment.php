<?php
class Model_Article_Comment extends Model_Base {

    function __construct() {
        $this->table = 'article_comments';
    }

    function find($limit, $start, $fields = '*') {
        $sql = "select c.id, a.title, c.content, c.create_time, c.user_name
				from article_comments c, articles a where a.id=c.article_id order by c.create_time desc
				limit :start, :limit";
        $query = DB::query(Database::SELECT, $sql);
        $query->param(':start', $start);
        $query->param(':limit', $limit);
        $results = $query->as_object()->execute();

        $arr = [];
        foreach ($results as $row) {
            $arr[] = $row;
        }
        return $arr;
    }
}
