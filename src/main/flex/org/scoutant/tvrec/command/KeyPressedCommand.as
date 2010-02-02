package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.ui.*;
//	import flash.events.KeyboardEvent;
	import flash.events.KeyboardEvent;
	import flash.net.*;
	
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
		 * <p> Ctrl + R : reload the Flash app!
		 * <p> Ctrl + W : "Close app, and open Google page instead", which can be closed with a second Ctrl+W...
		 */
		private function withCtrlKeyPressed(key:uint):void {
			if (key == 82) navigateToURL(new URLRequest("javascript:location.reload(true)"), "_self");					
			if (key == 87) navigateToURL(new URLRequest("http://www.google.com"), "_self");					
			if (key == Keyboard.RIGHT)	new IndexEvent('timeNavigate', 5).dispatch(); 
			if (key == Keyboard.LEFT) 	new IndexEvent('timeNavigate', -5).dispatch(); 
		}
			
		private function pressed(key:uint):void {
			var guide:Guide = Model.instance.guide;
			if (key == Keyboard.RIGHT)	new IndexEvent('timeNavigate', 1).dispatch(); 
			if (key == Keyboard.LEFT)	new IndexEvent('timeNavigate', -1).dispatch(); 
			if (key == Keyboard.DOWN)	new IndexEvent('channelNavigate', 1).dispatch(); 
			if (key == Keyboard.UP)		new IndexEvent('channelNavigate', -1).dispatch(); 
			// r, as 'record'
			if (key == 82) new CairngormEvent('setForRecord').dispatch(); 
			if (key == Keyboard.ENTER ) new CairngormEvent('watchChannel').dispatch(); 
			if (key == Keyboard.SPACE ) new CairngormEvent('pause').dispatch(); 

			if (key == Keyboard.SHIFT ) new CairngormEvent('recordChannel').dispatch(); 
		}
	}
}