package org.scoutant.tvrec.model {
	import mx.collections.ArrayCollection;
	
	import org.scoutant.tvrec.utils.StringUtil;
	
	public class Channel {
		
		public function Channel(id:String) {
			this.id = id;
		}
		
		public var id:String;
		[Bindable]
		public var name:String;

		/** url to download channel icon */
		public var icon:String;

		/** TV programs for that channel */
		public var programs:ArrayCollection = new ArrayCollection();
		
		/** append program */
		public function add(p:Program):void{
			programs.addItem( p);
		}
		
		public function toString():String{
			var str:String="Channel";
			str+=", id = "+id;
			str+=", name = "+name;
			str+=", nb programs : " + programs.length;
			return str;
		}
		
		/** 
		 * Retrieve program for a given "time" (in minutes) 
		 * Programs are listed in chronological order. Dichotomy style will be quickest
		 */
		public function getAtTime(time:Number):Program {
			var i:int;
			var p:Program;
			for (i=0; i< programs.length; i++) {
				p = programs.getItemAt(i) as Program;
				if ( time < p.z ) return p; 
			}
			return null;
		}

		/** Return normalized name, that can be used as file name on any OS */
		public function get normalizedName():String {
			return StringUtil.normalize( this.name);
		} 
		
	}
}