package com.orange.labs.car.will.utils {
	public class StringUtil {
		public static function toNumber( str:String):Number {
			str = unescape(str);
			if (str==null || str.length==0) return 0;
			return Number(str);
		}
		
		public static function toInt( str:String):int {
			str = unescape(str);
			if (str==null || str.length==0) return 0;
			return int(str);
		}
		
		// http://www.astorm.ch/blog/index.php?post/2008/08/07/trim-en-AS3
		public static function trim( str:String):String {
			if (str==null || str.length==0) return null;
			var r:RegExp = /^\s*(.*?)\s*$/g
			return str.replace(r, "$1");
		}
		
		public static function extractString( str:String, index:int):String {
			try {
				return trim( str.split("	")[index]);
			} catch(e:Error) {}
			return null;
		}
		
		public static function extractNumber( str:String, index:int):Number {
			return toNumber( extractString( str, index));
		}
		public static function extractInt( str:String, index:int):int {
			return toInt( extractString( str, index));
		}
		
	}
}