package org.scoutant.tvrec.command {
    import __AS3__.vec.Vector;
    
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import mx.controls.Alert;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class RecordChannel implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var channel:Channel = guide.channel;
			trace ("recording : " + channel);
			var ip:String = Model.instance.playlist.ip[channel.id];
			trace ("recording @ IP: " + ip);
			var args:Vector.<String> = new Vector.<String>();
			
			Alert.show( "recording channel : " + ip);
			
			// recording : cvlc $url --sout file/ps:/home/home/tv/$1.mpeg 
			args.push( ip);
			args.push( "--sout");			
			args.push( "file/ps:./recorded.mpeg");
			
			Process.instance.vlc( args);			
		}
	}
}