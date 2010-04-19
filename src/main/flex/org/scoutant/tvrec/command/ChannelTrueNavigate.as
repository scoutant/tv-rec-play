package org.scoutant.tvrec.command {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import mx.core.Application;
	import org.scoutant.tvrec.event.*;
	import org.scoutant.tvrec.model.*;
	public class ChannelTrueNavigate implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var guide:Guide = Model.instance.guide;
			var delta:int = (event as IndexEvent).index;
			try   {
				guide.changeChannel( delta);
				var old:Program = guide.current;
				var time:Number = Math.round( (old.a + old.z) / 2);
//				Model.instance.vpTime = time - Model.instance.viewportPadding;
				guide.current = guide.channel.getAtTime( time);
				guide.time = time;
				Application.application.programView.update();
			} catch (e:Error) {
				trace("Out of rage index, ");
			} 
		}
	}
}