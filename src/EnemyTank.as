package  
{
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent
	/**
	 * ...
	 * @author Kaj Loevesijn
	 */
	public class EnemyTank extends TankBase
	{
		private var shootTimer:Timer;
		public function EnemyTank() 
		{
			shootTimer = new Timer(1000+Math.random()*1500);
			shootTimer.addEventListener(TimerEvent.TIMER, shoot);
			shootTimer.start();
		}
		
		private function shoot(e:TimerEvent):void 
		{
			var se:ShootEvent = new ShootEvent("onShoot");
			se.shooter = this;
			dispatchEvent(se);
		}
		override public function loop(e:Event):void
		{
			targetPosition.x = Main.tank1.x - this.x;
			targetPosition.y = Main.tank1.y - this.y;
			
			super.loop(e);
		}
	}

}