package org.scoutant.tvrec.command {
    import __AS3__.vec.Vector;
    
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import mx.controls.Alert;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class WatchChannel implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var channel:Channel = guide.channel;
			trace ("watching : " + channel);
			var ip:String = Model.instance.playlist.ip[channel.id];
			trace ("watching @ IP: " + ip);
			var args:Vector.<String> = new Vector.<String>();
			
			Alert.show( "playing channel : " + ip);
			
			// playing : cvlc --fullscreen --play-and-exit $url
			args.push( "--fullscreen");			
			args.push( "--play-and-exit");			

//			args.push( ip);
			args.push( "/home/sooc7596/Documents/Tromboon-sample.ogg");
			
			Process.instance.vlc( args);			
		}
	}
}