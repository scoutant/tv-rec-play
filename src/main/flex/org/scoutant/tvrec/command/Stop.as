package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class Stop implements ICommand {
		public function execute( event : CairngormEvent ): void {
			trace ("stopping");
			Model.instance.isRecording = false;		
			Process.instance.stop();	
		}
	}
}