package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;
    
	public class StepForward implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var now:Number = Model.instance.now +1; 			
			Model.instance.now = now;
			// shall we start or stop recording any program?
			for (var i:int=0; i<guide.list.length; i++ ) {
				var channel:Channel = guide.getChannelByIndex(i);
				var program:Program = channel.getAtTime( now);
				if (program == null) return;
				if (program.record && program.a == now) {
					new ProgramEvent("recordProgram", program).dispatch();
				}
				// Give some 10 min marging, for many programs happen to extend plannification!
				// if (program.record && (program.z-1) == now) {
				if (program.record && (program.z-1) == now ) {
					new ProgramEvent("endOfRecording", program).dispatch();
				}
			}
		}	
	}
}