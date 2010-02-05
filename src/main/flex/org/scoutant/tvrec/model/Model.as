package org.scoutant.tvrec.model {
	import mx.containers.Canvas;
	import mx.core.Application;
	
	public class Model 	{
		protected static var _instance:Model;
		public static function get instance(): Model {
			if (_instance == null){
				_instance = new Model();
			}
			return _instance;
		}
		public function Model():void{
		}
		
		public var playlist:Playlist = new Playlist();
		
		[Bindable]
		public var guide:Guide = new Guide();
		
		public var viewport:Canvas;
		
		/** client platform time, not in miliseconds but in minutes, origine at 1970... */
		[Bindable]
		public var now:Number = 21040420;
//		public var now:Number = Math.round(new Date().getTime()/1000/60);
//		public var now:Number = 21065845;
		
		
		
		/** Viewport Time; will be recalculated when current program (time) happens to get out of viewport */
		[Bindable]
		public var vpTime:Number = now - 90;
		
		[Bindable] public var zoom:int = 5;
		
		/** in munites */
		[Bindable] public var vpDuration:Number = Math.round(Application.application.width / zoom);
		
		/** in munites */
		[Bindable] public var viewportPadding:Number = 60;

		[Bindable] public var isRecording:Boolean = false;
	}
}