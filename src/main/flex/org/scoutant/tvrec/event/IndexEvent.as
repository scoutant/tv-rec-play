package org.scoutant.tvrec.event {
	import flash.events.Event;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class IndexEvent extends CairngormEvent {
		public var eventType:String;
		public var index:int;
		
		public function IndexEvent(type:String, index:int) {
			super(type);
			this.index = index;
		}
		override public function clone() : Event {
			return new IndexEvent( eventType, index);
		}
		override public function toString():String {
			var s:String = "event " + this.type;
			s += ", index : " + index;
			return s;
		}
	}
}