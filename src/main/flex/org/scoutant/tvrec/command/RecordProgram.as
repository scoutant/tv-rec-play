package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class RecordProgram implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var program:Program = (event as ProgramEvent).program;
			/*
			var guide:Guide = Model.instance.guide;
			var channel:Channel = guide.channel;
			trace ("recording : " + channel);
			var ip:String = Model.instance.playlist.ip[channel.id];
			*/
			var ip:String = Model.instance.playlist.ip[program.channel];
			trace ("recording @ IP: " + ip);
			Model.instance.isRecording = true;			

			// TODO donner un nom reflétant le programme

//			Process.instance.vlc( "/home/sooc7596/Documents/Tromboon-sample.ogg --sout file/ps:./recorded.mpeg");			
			Process.instance.vlc( "/home/sooc7596/Documents/Tromboon-sample.ogg");			
			
			
		}
	}
}