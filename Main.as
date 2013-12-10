package  
{
	import flash.events.Event;
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Main extends MovieClip
	{
		private var canJump:Boolean = false;
		private var velocity:int = 10;
		private var gravity:int = -1;
		var counter:int = 0;
		public function Main() 
		{
			// constructor code
			this.addEventListener(Event.ENTER_FRAME,enterFrameListener);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpListener);
		}
		private function enterFrameListener(evt:Event)
		{
			
			if(canJump == true)
			{
				trace('counter at :'+ ++counter);
				mcTriangle.y -= velocity;
				velocity += gravity;
				mcTriangle.rotation += 120/21;
				if(velocity < -10)
				{
					canJump = false;
					velocity = 10;
				}
			}
			mcTriangle.x += 5;
			
			if(mcTriangle.x > stage.stageWidth)
			{
				mcTriangle.x = -mcTriangle.width/2;
			}
			
		}
		private function keyUpListener(evt:KeyboardEvent)
		{
			if(evt.keyCode == Keyboard.SPACE)
			{
				trace('can jump');
				canJump = true;
			}
		}

	}
	
}
