package org.scoutant.tvrec.event {
	import flash.events.Event;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.scoutant.tvrec.model.Program;

	public class ProgramEvent extends CairngormEvent {
		public var eventType:String;
		public var program:Program;
		
		public function ProgramEvent(type:String, item:Program) {
			super(type);
			this.program = item;
		}
		override public function clone() : Event {
			return new ProgramEvent( eventType, program);
		}
		override public function toString():String {
			var s:String = "event " + this.type;
			s += ", program : " + program;
			return s;
		}
	}
}