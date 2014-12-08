package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Kaj Loevesijn
	 */
	
	public class TankBase extends MovieClip
	{
		protected var tankBody:TankBodyArt;
		protected var tankTurret:TankTurretArt;
		public var turretAngle:Number = 0;
		public var targetPosition:Point;
		public var lives:int = 8;
		
		public function TankBase() 
		{
			this.addEventListener(Event.ENTER_FRAME, loop);
			targetPosition = new Point();
			tankBody = new TankBodyArt();
			this.addChild(tankBody);
			tankTurret = new TankTurretArt();
			this.addChild(tankTurret);	
		}
		public function loop (e:Event):void
		{
		var dx:Number = targetPosition.x;
			var dy:Number = targetPosition.y;
			
			var radian:Number = Math.atan2(dy, dx);
			var angle:Number = radian * 180 / Math.PI;
			
			tankTurret.rotation = angle;
			turretAngle = tankTurret.rotation;
		}
	}

}