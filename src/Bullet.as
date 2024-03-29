package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Kaj Loevesijn
	 */
	public class Bullet extends Sprite 
	{
		private var moveX:Number = 0;
		private var moveY:Number = 0;
		private var speed:Number = 16;
		public function Bullet(r:Number, tPos:Point) 
		{
			super();
			addChild(new BulletArt());
						
			this.rotation = r;	
			var radian:Number = r * Math.PI / 180;
			moveX = Math.cos(radian);
			moveY = Math.sin(radian);
			
			this.x = tPos.x + (60 * moveX);
			this.y = tPos.y + (60 * moveY);
			
		}
		public function update():void
		{
			this.x += moveX * speed;
			this.y += moveY * speed;
		}
		
	}

}