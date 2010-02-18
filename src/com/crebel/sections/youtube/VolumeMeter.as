package com.crebel.sections.youtube
{
	import flash.display.MovieClip;

	public class VolumeMeter extends MovieClip
	{
		public var filler:MovieClip;
		private var _isMuted:Boolean = false;
		
		public function VolumeMeter()
		{
			
		}
		
		public function mute():void
		{
			_isMuted = true;
			filler.width = 0;
		}
		
		public function unmute():void
		{
			_isMuted = false;
			filler.width = 19;
		}
		
		public function get isMuted():Boolean
		{
			return _isMuted;
		}
		
	}
}