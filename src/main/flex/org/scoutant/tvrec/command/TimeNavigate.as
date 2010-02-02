package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.ui.*;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class TimeNavigate implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var channel:Channel = guide.channel;
			var programs:ArrayCollection = channel.programs;
			var delta:int = (event as IndexEvent).index;
			trace("delta : " + delta);
			try   {
				var index:int = programs.getItemIndex( guide.current); 
				var targetIndex:int = index + delta;
				var target:Program = programs.getItemAt( targetIndex) as Program;
				if (target!= null) {
					guide.current = target;
					guide.time = Math.round( (target.a + target.z)/2);
					Application.application.programView.update();
				}
				// if necessary will operate a viewport shift
				if (target.z > Model.instance.vpTime + Model.instance.vpDuration - 10) {
					new IndexEvent("shiftViewport", +1).dispatch();
				} 			
				if (target.a < Model.instance.vpTime + 10) {
					new IndexEvent("shiftViewport", -1).dispatch();
				} 			
			} catch (e:Error) {
				trace("Out of rage index, ");
			} 
		}
	}
}