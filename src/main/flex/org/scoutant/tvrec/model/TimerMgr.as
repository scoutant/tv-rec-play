package org.scoutant.tvrec.model {
	import com.adobe.cairngorm.control.CairngormEvent;
	import flash.events.*;
	
	//import flash.utils.Timer;
	import flash.utils.Timer;
	
	public class TimerMgr 	{

		protected static var _instance:TimerMgr;
		public static function get instance(): TimerMgr {
			if (_instance == null){
				_instance = new TimerMgr();
			}
			return _instance;
		}

		public function TimerMgr() {
			_instance = this;
			timer = new Timer( 1000 * 60);
			timer.addEventListener( TimerEvent.TIMER, stepForward);
			timer.start();
		}

		private function stepForward(evt:TimerEvent):void {
			new CairngormEvent('stepForward').dispatch();
		}

		public var timer:Timer;

	}
}