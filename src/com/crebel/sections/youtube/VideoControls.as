package com.crebel.sections.youtube
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class VideoControls extends MovieClip
	{
		public var bg:MovieClip;
		public var highlight:MovieClip;
		public var playButton:MovieClip;
		public var pauseButton:MovieClip;
		public var progressBar:ProgressBar;
		public var volumeButton:MovieClip;
		public var divider1:MovieClip;
		public var divider2:MovieClip;
		
		private var _player:Object;
		
		public function VideoControls()
		{
			this.addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}
		
		private function onAddedToStage( e:Event ):void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			
			stage.addEventListener( Event.RESIZE, resize );
			resize();
			
			init();
		}
		
		public function set player( value:Object ):void
		{
			_player = value;
			progressBar.player = value;
		}
		
		private function init():void
		{
			highlight.mouseChildren = false;
			highlight.mouseEnabled = false;
			
			playButton.buttonMode = true;
			playButton.mouseChildren = false;
			playButton.addEventListener( MouseEvent.CLICK, playButtonClicked );
			playButton.visible = false;
			
			pauseButton.buttonMode = true;
			pauseButton.mouseChildren = false;
			pauseButton.addEventListener( MouseEvent.CLICK, pauseButtonClicked );
			
			volumeButton.buttonMode = true;
			volumeButton.mouseChildren = false;
			volumeButton.addEventListener( MouseEvent.CLICK, volumeButtonClicked );
			
			progressBar.init();
		}
		
		private function playButtonClicked( e:MouseEvent ):void
		{
			playVideo();
		}
		
		private function pauseButtonClicked( e:MouseEvent ):void
		{
			pauseVideo();	
		}
		
		public function pauseVideo():void
		{
			pauseButton.visible = false;
			playButton.visible = true;
			
			_player.pauseVideo();
		}	
		
		public function playVideo():void
		{
			playButton.visible = false;
			pauseButton.visible = true;
			
			_player.playVideo();
		}
		
		public function volumeButtonClicked( e:MouseEvent ):void
		{
			if( volumeButton.meter.isMuted )
			{
				_player.setVolume( 100 );
				volumeButton.meter.unmute();
			}
			else
			{
				_player.setVolume( 0 );
				volumeButton.meter.mute();
			}
		}
		
		public function updateLoad( value:Number ):void
		{
			progressBar.updateLoad( value );
		}
		
		public function updatePlay( value:Number ):void
		{
			progressBar.updatePlay( value );
		}
		
		private function resize( e:Event = null ):void
		{
			bg.width = stage.stageWidth;
			highlight.width = stage.stageWidth;
			
			divider2.x = stage.stageWidth - 31;
			progressBar.width = stage.stageWidth - 62;
			volumeButton.x = stage.stageWidth - 30;
		}
		
	}
}