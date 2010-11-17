package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;
	import mx.formatters.DateFormatter;
    
	public class StepForward implements ICommand {
		private var df:DateFormatter = new DateFormatter();
		public function StepForward():void{
			df.formatString = "HH:NN";
		}
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			//var now:Number = Model.instance.now +1;
		        var now:Number = Math.round(new Date().getTime()/1000/60);
			Model.instance.nowHHMM = df.format( new Date()); 			
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
				if (program.record && (program.z) == now ) {
					new ProgramEvent("endOfRecording", program).dispatch();
				}
			}
		}	
	}
}
