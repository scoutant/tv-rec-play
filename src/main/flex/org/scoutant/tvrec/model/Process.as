package org.scoutant.tvrec.model {
	import __AS3__.vec.Vector;
	
	import flash.desktop.*;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	
	import mx.controls.Alert;
	
	public class Process {
		protected static var _instance:Process;
		public static function get instance(): Process {
			if (_instance == null){
				_instance = new Process();
			}
			return _instance;
		}
		public function Process() {
			// info.executable =  File.documentsDirectory.resolvePath("vlc-play.sh");
//			info.executable =  new File("/usr/bin/cvlc");
			info.executable =  new File("/usr/bin/vlc");
   			process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onStandardOutputData); 				
		}

		public var process:NativeProcess = new NativeProcess();
		public var info:NativeProcessStartupInfo = new NativeProcessStartupInfo();
		
		// playing : cvlc --fullscreen --play-and-exit $url
		// recording : cvlc $url --sout file/ps:/home/home/tv/$1.mpeg 
		
		public function vlc( args:Vector.<String>):void {
			if (process.running) process.exit();
			info.arguments = args;
			process.start( info);
		}

		private function onStandardOutputData(event:ProgressEvent):void{
		    Alert.show(process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable));
		}				
	}	
}