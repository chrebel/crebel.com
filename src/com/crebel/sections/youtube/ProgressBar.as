package com.crebel.sections.youtube
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class ProgressBar extends MovieClip
	{
		public var bg:MovieClip;
		public var gutter:MovieClip;
		public var loadBar:MovieClip;
		public var playBar:MovieClip;
		
		private var _player:Object;
		
		public function ProgressBar()
		{
			
		}
		
		public function init():void
		{
			loadBar.mouseChildren = false;
			loadBar.mouseEnabled = false;
			
			playBar.mouseChildren = false;
			playBar.mouseEnabled = false;
			
			gutter.buttonMode = true;
			gutter.addEventListener( MouseEvent.CLICK, seekVideo );
			
			loadBar.width = 0;
			playBar.width = 0;
		}
		
		public function set player( value:Object ):void
		{
			_player = value;
		}
		
		private function seekVideo( e:MouseEvent ):void
		{
			_player.seekTo( _player.getDuration() * ( ( this.mouseX - gutter.x ) / gutter.width ) );
		}
		
		public function updateLoad( value:Number ):void
		{
			TweenLite.to( loadBar, 1, { width:value * gutter.width } );
		}
		
		public function updatePlay( value:Number ):void
		{
			TweenLite.to( playBar, 1, { width:value * gutter.width } );
			//playBar.width = ;	
		}
		
		override public function set width( value:Number ):void
		{
			bg.width = value;
			gutter.width = value - 18;
		}
		
	}
}