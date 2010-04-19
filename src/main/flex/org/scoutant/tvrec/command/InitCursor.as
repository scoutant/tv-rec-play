package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;
	public class InitCursor implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			try {
				guide.channel = guide.channels[guide.list.getItemAt(0)] as Channel;
				var time:Number = Math.round(new Date().getTime()/1000/60);
				Model.instance.now = time;	
				guide.current = guide.channel.getAtTime( time);
				guide.time = time;
				new IndexEvent('channelNavigate', 1).dispatch(); 
			} catch(error:Error) {
				trace("Cannot initialize Cursor");
			}
			trace ("Cursor is : " + guide.current);
		}
	}
}