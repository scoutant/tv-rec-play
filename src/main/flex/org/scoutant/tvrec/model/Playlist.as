package org.scoutant.tvrec.model {
	import flash.utils.*;
	public class Playlist {
		
		[Embed(source="/assets/icons/tf1.gif")] private static var tf1:Class
		[Embed(source="/assets/icons/france2.gif")] private static var france2:Class
		[Embed(source="/assets/icons/france3.gif")] private static var france3:Class
		[Embed(source="/assets/icons/canalplus.gif")] private static var canalplus:Class
		[Embed(source="/assets/icons/m6.gif")] private static var m6:Class
		[Embed(source="/assets/icons/france5.gif")] private static var france5:Class
		[Embed(source="/assets/icons/w9.gif")] private static var w9:Class
		[Embed(source="/assets/icons/gulli.gif")] private static var gulli:Class

		/*		
		[Embed(source="/assets/icons/.gif")] private static var :Class
		[Embed(source="/assets/icons/.gif")] private static var :Class
		[Embed(source="/assets/icons/.gif")] private static var :Class
		[Embed(source="/assets/icons/.gif")] private static var :Class
		[Embed(source="/assets/icons/.gif")] private static var :Class
		[Embed(source="/assets/icons/.gif")] private static var :Class
		[Embed(source="/assets/icons/.gif")] private static var :Class
		*/

		public function Playlist() {
			icon['C1.telepoche.com'] = tf1; ip['TF1'] = "rtp://@232.0.1.17:8200";
			icon['C2.telepoche.com'] = france2; ip['C2.telepoche.com'] = "rtp://@232.0.1.1:8200";
			icon['C3.telepoche.com'] = france3; ip['C3.telepoche.com'] = "rtp://@232.0.1.2:8200";
			icon['C4.telepoche.com'] = canalplus; ip['C4.telepoche.com'] = "rtp://@232.0.5.1:8200";
			// Attention C5 c'est Arte
			icon['C5.telepoche.com'] = null; ip['C5.telepoche.com'] = "rtp://@232.0.1.5:8200";
			icon['C6.telepoche.com'] = m6; ip['C6.telepoche.com'] = "rtp://@232.0.1.10:8200";
			// C7 c'est france 5
			icon['C7.telepoche.com'] = france5; ip['C7.telepoche.com'] = "rtp://@232.0.1.4:8200";

			icon['C38.telepoche.com'] = w9; ip['C38.telepoche.com'] = "rtp://@232.0.1.43:8200";
			icon['C195.telepoche.com'] = gulli; ip['C195.telepoche.com'] = "rtp://@232.0.1.12:8200";

			/*
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			*/
		}
		
		public var icon:Dictionary = new Dictionary();
		public var ip:Dictionary = new Dictionary();

	}
}