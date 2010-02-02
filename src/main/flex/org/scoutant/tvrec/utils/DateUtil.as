package org.scoutant.tvrec.utils {
	import mx.formatters.DateFormatter;
	
	public class DateUtil{
		/**
		 * start="20100110175500 +0100"
		 * @param date with format : 20100110175500 +0100
		 * @return corresponding time, not in miliseconds but in minutes, origin at 1970/01/01
		 */
		public static function parse(s:String):Number {
			if (s == null || s.length == 0) {
				trace("Date null!");
				return NaN;
			}
			var year:String = s.substring(0,4);
			var month:String = s.substring(4,6);
			var day:String = s.substring(6,8);
			var hour:String = s.substring(8,10);
			var minute:String = s.substring(10,12);
			// caution month begins with zero for Date constructor!
			var date:Date = new Date(year, int( month) -1, day, hour, minute);
			//trace( "Date is : " + date.toString() );
			return (date.getTime()/1000/60);
		} 
		
		private static var df:DateFormatter = new DateFormatter();
		{
			df.formatString = "YYYYMMDD HHNNSS";
		}
		public static function format(d:Date):String {
			return df.format( d);
		}
	}
}