package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class EndOfRecording implements ICommand {
		public function execute( event : CairngormEvent ): void {
			trace ("end of program being recorded");
			// do end if actually recording
			if (Model.instance.isRecording) {
				Model.instance.isRecording = false;		
				Process.instance.stop();
			}
		}
	}
}