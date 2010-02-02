package org.scoutant.tvrec.model {
	import org.scoutant.tvrec.utils.DateUtil;
	
	public class Program {
		public var channel:String;
		public var _start:String;
		public var _stop:String;
		[Bindable]
		public var title:String;
		public var subtitle:String;
		public var desc:String;
		public var category:String="";
		public var actors:String="";

		[Bindable]
		public var record:Boolean=false;
		
		public function Program():void{
		}
		
		/** 20100110185000 +0100  --> HH:MM */
		public function get start():String{
			return _start.substr(8,2)+ "h" + _start.substr(10,2);
		}
		public function get stop():String{
			return _stop.substr(8,2)+ "h" + _stop.substr(10,2);
		}

		/** Europeen style DD/MM */
		public function get day():String{
			return _start.substr(6,2)+ "/" + _start.substr(4,2);
		}


		/** Return start as 2010-01-10-18h50 */
		public function get date():String {
			return _start.substr(0,4)+ "-" + _start.substr(4,2) +"-" + _start.substr(6,2) + "-" + _start.substr(8,2) + "h" + _start.substr(10,2);
		}

		[Bindable]	
		public function get a():Number {
			return DateUtil.parse( _start);
		}		
		public function set a(v:Number):void{}
		
		[Bindable]	
		public function get z():Number {
			return DateUtil.parse( _stop);
		}		
		public function set z(v:Number):void{}
		
		/** Return normalized title, that can be used as file name on any OS */
		public function get normalizedTitle():String {
			var str:String = title.toLowerCase();
			str = str.replace(/\.\.\./g, "-" );
			str = str.replace(/\?/g, "" );
			str = str.replace(/!/g, "" );
			str = str.replace(/\./g, "-" );
			str = str.replace(/,/g, "-" );
			str = str.replace(/ $/g, "" );
			str = str.replace(/ /g, "-" );
			str = str.replace(/à/g, "a" );
			str = str.replace(/é|è/g, "e" );
			str = str.replace(/ï|î/g, "i" );
			str = str.replace(/ù/g, "u" );
			str = str.replace(/ç/g, "c" );
			str = str.replace(/\'/g, "-" );
			str = str.replace(/\+/g, "-" );
			return str;
		}		


		public function toString():String {
			var str:String = "Program";
			str+=" start:" + start;
			str+=", stop:" + stop;
			str+=", title:" + title;
			str+=", start in min:" + a;
			str+=", category:" + category;
			str+=", actors:" + actors;
			return str;
		}
		
	}
}