<?php
class Helper_Util {
    static function get_uuid() {
        return md5(uniqid(mt_rand(), true));
    }
}
