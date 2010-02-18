package com.crebel
{
	import com.crebel.sections.youtube.YouTubePlayer;
	
	import flash.display.Sprite;

	public class Main extends Sprite
	{
		private var _player:YouTubePlayer;
		//private var _stats:Stats;
		
		public function Main()
		{
			stage.align = "TL";
			stage.scaleMode = "noScale";

			_player = new YouTubePlayer();
			this.addChild( _player );
			
			//_stats = new Stats();
			//this.addChild( _stats );
		}
	}
}
