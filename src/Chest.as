package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Kaj Loevesijn
	 */
	public class Chest extends Sprite
	{
		private var chestArt:MovieClip;
		public var lives:int = 8;
		public function Chest() 
		{
			chestArt = new ChestArt();
			addChild(chestArt);
		}
		
	}

}