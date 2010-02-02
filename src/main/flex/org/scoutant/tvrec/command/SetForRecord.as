package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;
    
	public class SetForRecord implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var program:Program = Model.instance.guide.current;
			trace ("Setting for record : " + program);
			if (program.z < Model.instance.now) {
				// wont bother past programs...
				return;
			}
			program.record = !program.record;
		}	
	}
}