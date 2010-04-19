package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class RecordProgram implements ICommand {
		public function execute( event : CairngormEvent ): void {
			// if program already beeing recorded, we gracefully stop it and proceed with the new recording
			// TODO give user feedback when she adds a program to be recorded but happen to overlap with others  	
			if (Model.instance.isRecording) {
				trace ("first stopping current recording... ");
				Model.instance.isRecording = false;		
				Process.instance.stop();
			}

			var program:Program = (event as ProgramEvent).program;
			var ip:String = Model.instance.playlist.ip[program.channel];
			trace ("recording @ IP: " + ip + ", to file : " + program.date+".mpeg");
			Model.instance.isRecording = true;			
			Process.instance.vlc( ip+" --sout file/ps:/home/coutant/tele/"+program.normalizedTitle+"-"+program.date+".mpeg");			
		}
	}
}