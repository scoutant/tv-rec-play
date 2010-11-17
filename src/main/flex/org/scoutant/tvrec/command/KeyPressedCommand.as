package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.KeyboardEvent;
	import flash.net.*;
	import flash.ui.*;
	
	import mx.core.Application;
	
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class KeyPressedCommand implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var keyboardEvent:KeyboardEvent = (event as KeyEvent).keyboardEvent;
			var key:uint = keyboardEvent.keyCode;
			trace("key pressed : " + key);
			if (keyboardEvent.ctrlKey) {
				withCtrlKeyPressed( key);
			} else {
				pressed( key);				
			}
		}
		
		/**
		 * <p> Ctrl + R : reload the app! TODO
		 * <p> Ctrl + W : Quit the application
		 */
		private function withCtrlKeyPressed(key:uint):void {
			// if (key == 82) TODO. When Air app is lauched from Browser, just need to use launchApplication 
			// as mentionned in http://www.davidtucker.net/2008/04/01/air-tip-11-launching-an-air-application-from-an-air-application/
			// http://www.hufkens.net/2009/03/how-to-restart-an-air-application-from-code/					
			if (key == 87) Application.application.close();
			// If you need Air specific stuff, just cast to WindowedApplication, like so : WindowedApplication ( Application.application)
			if (key == Keyboard.RIGHT)	new IndexEvent('timeNavigate', 3).dispatch(); 
			if (key == Keyboard.LEFT) 	new IndexEvent('timeNavigate', -3).dispatch(); 
			if (key == Keyboard.ENTER ) new CairngormEvent('recordChannel').dispatch();
			if (key == Keyboard.DOWN)	new IndexEvent('channelTrueNavigate', 1).dispatch(); 
			if (key == Keyboard.UP)		new IndexEvent('channelTrueNavigate', -1).dispatch(); 
		}
			
		private function pressed(key:uint):void {
			var guide:Guide = Model.instance.guide;
			if (key == Keyboard.RIGHT)	new IndexEvent('timeNavigate', 1).dispatch(); 
			if (key == Keyboard.LEFT)	new IndexEvent('timeNavigate', -1).dispatch(); 
			if (key == Keyboard.DOWN)	new IndexEvent('channelNavigate', 1).dispatch(); 
			if (key == Keyboard.UP)		new IndexEvent('channelNavigate', -1).dispatch(); 
			// o, set for record, marking with a dot icon...
			if (key == Keyboard.O) new CairngormEvent('setForRecord').dispatch();
			// s : stop any play or record
			if (key == Keyboard.S ) new CairngormEvent('stop').dispatch(); 
			if (key == Keyboard.ENTER ) new CairngormEvent('watchChannel').dispatch(); 
			if (key == Keyboard.E ) new CairngormEvent('watchChannel').dispatch(); 
			if (key == Keyboard.SPACE ) new CairngormEvent('pause').dispatch(); 
		}
	}
}
