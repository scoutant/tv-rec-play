package org.scoutant.tvrec.model {
	import __AS3__.vec.Vector;
	
	import flash.desktop.*;
	import flash.events.NativeProcessExitEvent;
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
   			process.addEventListener(NativeProcessExitEvent.EXIT, onExit); 				
		}

		public var process:NativeProcess = new NativeProcess();
		public var info:NativeProcessStartupInfo = new NativeProcessStartupInfo();
		
		// playing : cvlc --fullscreen --play-and-exit $url
		// recording : cvlc $url --sout file/ps:/home/home/tv/$1.mpeg 
		
		public function stop():void {
			if (process.running) {
				process.exit();
			}
		}
		
		public function vlc( args:String):void {
			if (process.running) {
				cmdArgs = args;
				process.exit();
			} else {
				doVlc( args);
			}
		}
		
		private var cmdArgs:String;
		
		private function onExit(event:NativeProcessExitEvent):void {
			doVlc( cmdArgs);
		}		
		
		private function doVlc( args:String):void {
			if (args!=null && args.length>0 ) {
				info.arguments = toVector(args);
				process.start( info);			
			}
		}

		private function onStandardOutputData(event:ProgressEvent):void{
		    Alert.show(process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable));
		}				
		
		/** return a String Vector. Using blank as separator */
		private static function toVector( str:String):Vector.<String> {
			var arr:Array = str.split(" ");
			var v:Vector.<String> = new Vector.<String>();
			for (var i:int=0; i<arr.length;i++) {
				v.push( arr[i] as String); 
			}
			return v;
		} 
	}	
}