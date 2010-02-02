package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;

	public class Pause implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var channel:Channel = guide.channel;
			trace ("pause or resuming ? for channel : " + channel);
		}
	}
}