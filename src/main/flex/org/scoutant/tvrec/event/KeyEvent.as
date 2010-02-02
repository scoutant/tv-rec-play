package org.scoutant.tvrec.event {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class KeyEvent extends CairngormEvent {
		public var eventType:String;
		public var keyboardEvent:KeyboardEvent;
		
		public function KeyEvent(type:String, item:KeyboardEvent) {
			super(type);
			this.keyboardEvent= item;
		}
		override public function clone() : Event {
			return new KeyEvent( eventType, keyboardEvent);
		}
		override public function toString():String {
			var s:String = "event " + this.type;
			s += ", keyboardEvent.keyCode : " + keyboardEvent.keyCode;
			return s;
		}
	}
}