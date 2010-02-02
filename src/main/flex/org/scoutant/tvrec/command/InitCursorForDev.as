package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;
    /** Setting Cursor at first channel and at third program */
	public class InitCursorForDev implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			guide.channel = guide.channels[guide.list.getItemAt(0)] as Channel;
			guide.current = guide.channel.programs.getItemAt(2) as Program;
			Model.instance.now = guide.current.a; 
			guide.time = Model.instance.now; 
			trace ("Cursor is : " + guide.current);
		}
	}
}