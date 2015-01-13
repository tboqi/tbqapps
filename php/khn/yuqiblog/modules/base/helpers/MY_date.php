<?php
class date extends date_Core {
	
	static function weekday() {
		switch (date ( 'w' )) {
			case 0 :
				return '星期日';
				break;
			
			case 1 :
				return '星期一';
				break;
			
			case 2 :
				return '星期二';
				break;
			
			case 3 :
				return '星期三';
				break;
			
			case 4 :
				return '星期四';
				break;
			
			case 5 :
				return '星期五';
				break;
			
			default :
				return '星期六';
				break;
		}
	
	}
}