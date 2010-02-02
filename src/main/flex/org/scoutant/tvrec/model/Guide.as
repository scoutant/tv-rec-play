package org.scoutant.tvrec.model {
	import flash.utils.*;
	
	import mx.collections.ArrayCollection;
	
	/**
	 * the TV Guide is a collection of Tv programs organized by channel
	 */
	public class Guide {
		public function Guide():void{
		}

		public function toString():String {
			var l:int=0;
			for (var c:Object in channels) l++; 
			return "Guide - nb of channels : " + l;
		}
		public var channels:Dictionary = new Dictionary();

		/** Ordered list of channel IDs */
		public var list:ArrayCollection = new ArrayCollection();

		public function addChannel(c:Channel):void{
			channels[c.id]=c;
			list.addItem( c.id);
		}
	
		public function getChannelByIndex(index:int):Channel {
			return channels[list.getItemAt( index)] as Channel;
		}
	
		/**
		 * Adds a program to the guide. Program.channel has to be valued by the channel id 
		 */ 
		
		public function add(p:Program):void{
			if (p==null) return;
			if (p.channel == null || p.channel.length==0) {
				throw new Error("channel id for program has to be provided!");
			}
			var channel:Channel = channels[ p.channel];
			 channel.add( p);
		}

		/** Current program as cursor in the guide */		
		[Bindable]
		public var current:Program;		
		
		/** time, not in miliseconds but in minutes, origine at 1970... */
		[Bindable]
		public var time:Number;

		/** Currently selected channel */
		[Bindable]
		public var channel:Channel


		[Bindable]
		private var channelIndex:int=0;

		public function changeChannel(delta:int):Boolean {
			var targetIndex:int = channelIndex + delta;
			var done:Boolean = (targetIndex >= 0) && (targetIndex < list.length);
			if (done) {
				channelIndex = targetIndex;
				channel = channels[list.getItemAt( channelIndex)];
			}
			return done;
		}

	}
}