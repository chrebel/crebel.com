package com.crebel.sections.youtube
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.Security;

	public class YouTubePlayer extends MovieClip
	{
		private var _loader:Loader;
		private var _player:Object;
		private var _controls:VideoControls;
		
		public function YouTubePlayer()
		{
			this.addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
		}
		
		private function onAddedToStage( e:Event ):void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
			this.addEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
			
			_controls = new VideoControls();
			this.addChild( _controls );
			
			stage.addEventListener( Event.RESIZE, resize );
						
			init();
		}
		
		private function onRemovedFromStage( e:Event ):void
		{
			this.removeEventListener( Event.REMOVED_FROM_STAGE, onRemovedFromStage );
			stage.removeEventListener( Event.RESIZE, resize );
		}
		
		private function init():void
		{
			Security.allowDomain( "http://www.youtube.com" );
			
			_player = new Object();
						
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener( Event.INIT, onLoaderInit );
			_loader.load( new URLRequest( "http://www.youtube.com/apiplayer?version=3" ) );
		}
		
		private function onLoaderInit( e:Event ):void
		{
			this.addChild( _loader );
			_loader.content.addEventListener( "onReady", onPlayerReady );
    		_loader.content.addEventListener( "onError", onPlayerError );
    		_loader.content.addEventListener( "onStateChange", onPlayerStateChange );
    		_loader.content.addEventListener( "onPlaybackQualityChange", onVideoPlaybackQualityChange );
		}
		
		private function onPlayerReady( e:Event ):void
		{
			_player = _loader.content;
			_player.setPlaybackQuality( "large" );
			_player.loadVideoByUrl( "http://www.youtube.com/v/PsPOiflvHX4" );
			
			_controls.player = _player;
			
			resize();
			
			this.addEventListener( Event.ENTER_FRAME, update );
		}
		
		private function update( e:Event ):void
		{
			_controls.updateLoad( _player.getVideoBytesLoaded / _player.getVideoBytesTotal() );
			_controls.updatePlay( _player.getCurrentTime() / _player.getDuration() );
		}
		
		private function onPlayerError( e:Event ):void 
		{
		   
		}
		
		private function onPlayerStateChange( e:Event ):void 
		{
		    switch( Object( e ).data )
		    {
		    	case 0 :
		    		_player.seekTo( 0 );
		    		_player.playVideo();
		    		break;
		    }
		}
		
		private function onVideoPlaybackQualityChange( e:Event ):void 
		{
		   
		}
				
		private function resize( e:Event = null ):void
		{
			_player.setSize( stage.stageWidth, stage.stageHeight - _controls.height );
			_controls.y = stage.stageHeight - _controls.height;
		}
		
	}
}