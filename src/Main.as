package
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Kaj loevesijn
	 */
	public class Main extends Sprite
	{
		public static var tank1:Tank;
		private var enemies:Array
		private var bullets:Vector.<Bullet>;
		private var chests:Vector.<Chest>;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			tank1 = new Tank(); //niet meer hier
			enemies = new Array();
			for (var i:int = 0; i < 3; i++)
			{
				var enemy:EnemyTank = new EnemyTank();
				enemies.push(enemy);
				addChild(enemy);
				enemy.x = Math.random() * stage.stageWidth;
				enemy.y = Math.random() * stage.stageHeight;
				enemy.addEventListener("onShoot", createBullet);
			}
			tank1 = new Tank(); //niet meer hier
			this.addChild(tank1); //maar wel hier
			
			tank1.x = 300;
			tank1.y = 300;
			
			tank1.addEventListener("onShoot", createBullet);
			
			bullets = new Vector.<Bullet>();
			
			chests = new Vector.<Chest>();
			
			createChests();
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function createChests():void
		{
			for (var i:int = 0; i < 10; i++)
			{
				var chest:Chest = new Chest();
				chests.push(chest);
				addChild(chest);
				chest.x = Math.random() * stage.stageWidth;
				chest.y = Math.random() * stage.stageHeight;
				chest.scaleX = chest.scaleY = tank1.scaleX;
			}
		}
		
		private function loop(e:Event):void
		{
			for (var i:int = 0; i < bullets.length; i++)
			{
				var toRemove:Boolean = false;
				
				bullets[i].update();
				
				for (var j:int = 0; j < chests.length; j++)
				{
					if (chests[j].hitTestPoint(bullets[i].x, bullets[i].y, true))
					{
						toRemove = true;
						
						chests[j].lives--;
						if (chests[j].lives <= 0)
						{
							removeChild(chests[j]);
							chests.splice(j, 1);
						}
					}
				}
				for (var k:int = 0; k < enemies.length; k++)
				{
					if (enemies[k].hitTestPoint(bullets[i].x, bullets[i].y, true))
					{
						toRemove = true;
						
						enemies[k].lives--;
						if (enemies[k].lives <= 0)
						{
							removeChild(enemies[k]);
							enemies.splice(k, 1);
						}
						
					}
					
				}
				
				
				
				
				
				
				
				if (bullets[i].x > stage.stageWidth || bullets[i].x < 0 || bullets[i].y > stage.stageHeight || bullets[i].y < 0)
				{
					
					toRemove = true;
					
				}
				if (toRemove)
				{
					removeChild(bullets[i]);
					bullets.splice(i, 1);
				}
				
			}
		}
		
		private function createBullet(e:ShootEvent):void
		{
			var r:Number = e.shooter.turretAngle + e.shooter.rotation;
			var tPos:Point = new Point(e.shooter.x, e.shooter.y);
			var b:Bullet = new Bullet(r,tPos);		
			bullets.push(b);			
			addChild(b);
			b.scaleX = b.scaleY = tank1.scaleX;
		
		}
	
	}

}