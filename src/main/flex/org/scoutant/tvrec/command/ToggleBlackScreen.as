package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	
	import mx.core.Application;
	
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;

	public class ToggleBlackScreen implements ICommand {

		public function execute( event : CairngormEvent ): void {
			trace ("toggle black screen");
			var stage:Stage = Application.application.stage;
			stage.displayState = ( stage.displayState == StageDisplayState.NORMAL ? StageDisplayState.FULL_SCREEN_INTERACTIVE : StageDisplayState.NORMAL );
			Application.application.blackScreen.visible = (stage.displayState == StageDisplayState.FULL_SCREEN_INTERACTIVE)  			
		}
	}
}
