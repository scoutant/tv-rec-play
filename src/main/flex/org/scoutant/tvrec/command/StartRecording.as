package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class StartRecording implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var program:Program = (event as ProgramEvent).program;
			//trace("Start recording program : " + program);
			trace("Start recording program : " + program.date + "-" + program.normalizedTitle);
			
			// utiliser le titre comme nom de fichier? enlever les ... les accents, les espaces
		}
	}
}