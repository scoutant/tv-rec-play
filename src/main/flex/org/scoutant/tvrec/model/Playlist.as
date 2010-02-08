package org.scoutant.tvrec.model {
	import flash.utils.*;
	public class Playlist {
		
		[Embed(source="/assets/icons/tf1.png")] private static var tf1:Class
		[Embed(source="/assets/icons/france2.png")] private static var france2:Class
		[Embed(source="/assets/icons/france3.png")] private static var france3:Class
		[Embed(source="/assets/icons/canalplus.svg")] private static var canalplus:Class
		[Embed(source="/assets/icons/france5.png")] private static var france5:Class
		[Embed(source="/assets/icons/m6.png")] private static var m6:Class
		[Embed(source="/assets/icons/direct8.png")] private static var direct8:Class
		[Embed(source="/assets/icons/w9.svg")] private static var w9:Class
		[Embed(source="/assets/icons/tmc.gif")] private static var tmc:Class
		[Embed(source="/assets/icons/rtl9.png")] private static var rtl9:Class
		[Embed(source="/assets/icons/arte.svg")] private static var arte:Class
		[Embed(source="/assets/icons/france4.png")] private static var france4:Class
		[Embed(source="/assets/icons/franceo.png")] private static var franceo:Class
		[Embed(source="/assets/icons/nrj12.png")] private static var nrj12:Class
		[Embed(source="/assets/icons/virgin17.png")] private static var virgin17:Class
		[Embed(source="/assets/icons/gulli.gif")] private static var gulli:Class
		[Embed(source="/assets/icons/tv5monde.png")] private static var tv5monde:Class

		public function Playlist() {
			icon['C1.telepoche.com'] = tf1; ip['C1.telepoche.com'] = "rtp://@232.0.1.17:8200";
			icon['C2.telepoche.com'] = france2; ip['C2.telepoche.com'] = "rtp://@232.0.1.1:8200";
			icon['C3.telepoche.com'] = france3; ip['C3.telepoche.com'] = "rtp://@232.0.1.2:8200";
			icon['C4.telepoche.com'] = canalplus; ip['C4.telepoche.com'] = "rtp://@232.0.5.1:8200";
			icon['C5.telepoche.com'] = arte; ip['C5.telepoche.com'] = "rtp://@232.0.1.5:8200";
			icon['C6.telepoche.com'] = m6; ip['C6.telepoche.com'] = "rtp://@232.0.1.10:8200";
			icon['C7.telepoche.com'] = france5; ip['C7.telepoche.com'] = "rtp://@232.0.1.4:8200";
			// TODO @ IP de RTL 9 ?
			//icon['C8.telepoche.com'] = rtl9; ip['C8.telepoche.com'] = "";
			icon['C9.telepoche.com'] = tmc; ip['C9.telepoche.com'] = "rtp://@232.0.1.7:8200";
			icon['C28.telepoche.com'] = france4; ip['C28.telepoche.com'] = "rtp://@232.0.1.9:8200";
			icon['C193.telepoche.com'] = virgin17; ip['C193.telepoche.com'] = "rtp://@232.0.1.11:8200";
			icon['C38.telepoche.com'] = w9; ip['C38.telepoche.com'] = "rtp://@232.0.1.43:8200";
			icon['C169.telepoche.com'] = nrj12; ip['C169.telepoche.com'] = "rtp://@232.0.1.8:8200";
			icon['C195.telepoche.com'] = gulli; ip['C195.telepoche.com'] = "rtp://@232.0.1.12:8200";
			// TODO c'est quoi l'id de TV 5 monde?
			icon['C.telepoche.com'] = tv5monde; ip['C.telepoche.com'] = "rtp://@232.0.1.13:8200";

			/*
			icon['C.telepoche.com'] = ; ip['C.telepoche.com'] = "";
			*/			
		}
		
		public var icon:Dictionary = new Dictionary();
		public var ip:Dictionary = new Dictionary();

	}
}