package org.scoutant.tvrec.controller {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.FrontController;
	
	import org.scoutant.tvrec.command.*;

	public class Controller  extends FrontController {
		/**
		 * Caution do not forget explicit init(), but after parameters injection, ie after Application 'creationComplete' event. 
		 */
		public function Controller() {
			init();
		}

		/**
		 * Injection of commands. Mock commands if the case. 
		 */ 
		public function init(mock:Boolean=false):void {
			trace( "Controller, ADDING Commands"); 
			addCommand("getPrograms", GetPrograms);
			addCommand("keyPressed", KeyPressedCommand);
			addCommand("timeNavigate", TimeNavigate);
			addCommand("channelNavigate", ChannelNavigate);
			addCommand("initCursor", InitCursor);
			addCommand("initCursorForDev", InitCursorForDev);
			addCommand("populateViewport", PopulateViewport);
			addCommand("setForRecord", SetForRecord);
			addCommand("shiftViewport", ShiftViewport);
			addCommand("stepForward", StepForward);
			addCommand("startRecording", StartRecording);
			addCommand("watchChannel", WatchChannel);
			addCommand("pause", Pause);

			addCommand("recordChannel", RecordChannel);
		}
		
		override protected function executeCommand(event:CairngormEvent):void {
			trace( "Will trigger : " + getCommand(event.type) +", with event : " + event);
			if (event.type != 'stepForward') {
//				Model.instance.events.addItemAt( event, 0);
			} 
			super.executeCommand( event);
		}
	}
}