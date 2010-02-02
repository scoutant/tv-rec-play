package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    
    import mx.collections.ArrayCollection;
    import mx.containers.Canvas;
    
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;
    import org.scoutant.tvrec.view.*;
	public class PopulateViewport implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var viewport:Canvas = Model.instance.viewport;
			var guide:Guide = Model.instance.guide;
			var time:Number = guide.time;
			var channel:Channel;
			var programs:ArrayCollection;
			var program:Program;
			var cell:Cell;
			
			// for() much faster than for each ()?			
			for (var c:int=0 ; c<guide.list.length; c++) {
				channel = guide.getChannelByIndex(c);
				programs = channel.programs;
				for ( var p:int=0; p<programs.length; p++ ) {
					program = programs.getItemAt(p) as Program;
					trace ("plotting " + program);
					cell = new Cell();
					cell.program = program;
					cell.height = 50;
					cell.y = 30+c*35; 
					cell.width =  (program.z - program.a) * Model.instance.zoom - 2 ;
					viewport.addChild( cell);
				}
			}
		}
	
	}
}