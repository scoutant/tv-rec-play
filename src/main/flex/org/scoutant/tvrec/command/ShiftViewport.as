package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.ui.*;
	
	import mx.core.Application;
	
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class ShiftViewport implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var delta:int = (event as IndexEvent).index;
			trace("delta : " + delta);
			try   {
				if (delta==1) {
					Model.instance.vpTime = Model.instance.guide.time - Model.instance.viewportPadding;
				}
				if (delta==-1) {
					Model.instance.vpTime = Model.instance.guide.time + Model.instance.viewportPadding - Model.instance.vpDuration;
				}
				
			} catch (e:Error) {
				trace("Could not shift view port");
			} 
		}
	}
}