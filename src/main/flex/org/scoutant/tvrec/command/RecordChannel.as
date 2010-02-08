package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class RecordChannel implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var channel:Channel = guide.channel;
			var ip:String = Model.instance.playlist.ip[channel.id];
			trace ("recording channel @ IP: " + ip + ", to file : recorded.mpeg");
			Model.instance.isRecording = true;			
//			Process.instance.vlc( ip+" --sout file/ps:/home/coutant/tele/recorded.mpeg");			
			Process.instance.vlc( ip+" --sout file/ps:/home/coutant/tele/"+channel.normalizedName+"-"+Model.instance.now+".mpeg");			
//			Process.instance.vlc( "/home/sooc7596/Documents/Tromboon-sample.ogg");			
		}
	}
}