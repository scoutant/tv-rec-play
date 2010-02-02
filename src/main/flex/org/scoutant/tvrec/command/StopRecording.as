package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class StopRecording implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var program:Program = (event as ProgramEvent).program;
			//trace("Stop recording program : " + program);
			trace("Stop recording program : " + program.date + "-" + program.title);
		}
	}
}