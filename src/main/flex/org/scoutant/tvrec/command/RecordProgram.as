package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class RecordProgram implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var program:Program = (event as ProgramEvent).program;
			var ip:String = Model.instance.playlist.ip[program.channel];
			trace ("recording @ IP: " + ip + ", to file : " + program.date+".mpeg");
			Model.instance.isRecording = true;			
			Process.instance.vlc( ip+" --sout file/ps:/home/coutant/tele/"+program.normalizedTitle+"-"+program.date+".mpeg");			
//			Process.instance.vlc( "/home/sooc7596/Documents/Tromboon-sample.ogg");			
		}
	}
}