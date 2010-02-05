package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class RecordChannel implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var channel:Channel = guide.channel;
			trace ("recording : " + channel);
			var ip:String = Model.instance.playlist.ip[channel.id];
			trace ("recording @ IP: " + ip);
			Model.instance.isRecording = true;			
			// TODO donner un nom reflétant la chaine
//			Process.instance.vlc( "/home/sooc7596/Documents/Tromboon-sample.ogg --sout file/ps:./recorded.mpeg");			
			Process.instance.vlc( "/home/sooc7596/Documents/Tromboon-sample.ogg");			
		}
	}
}