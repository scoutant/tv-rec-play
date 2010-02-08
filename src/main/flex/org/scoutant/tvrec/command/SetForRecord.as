package org.scoutant.tvrec.command {
    import com.adobe.cairngorm.commands.ICommand;
    import com.adobe.cairngorm.control.CairngormEvent;
    import org.scoutant.tvrec.event.*;
    import org.scoutant.tvrec.model.*;
    
	public class SetForRecord implements ICommand {
		public function execute( event : CairngormEvent ): void {
			var program:Program = Model.instance.guide.current;
			trace ("Setting for record : " + program);
			// TODO mais si c'est un programme qui est précisément en cours ! on en tient compte et on lance l'enregistrement égalkement !
			if (program.z < Model.instance.now) {
				// wont bother past programs...
				return;
			}
			program.record = !program.record;
			// if happen to be a current program, start recording immidiately!
			if (program.a <= Model.instance.now && Model.instance.now < program.z) {
				trace ("and starting recording !");
				new ProgramEvent("recordProgram", program).dispatch();
			}
		}	
	}
}