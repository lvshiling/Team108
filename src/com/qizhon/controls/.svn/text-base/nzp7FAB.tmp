package com.qizhon.controls
{
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.debug.Logger;
	import com.pblabs.engine.entity.EntityComponent;
	import com.pblabs.engine.entity.IEntityComponent;
	import com.pblabs.rendering2D.DisplayObjectRenderer;
	import com.pblabs.rendering2D.IScene2D;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	public class MouseManager extends EntityComponent
	{
		
		public function MouseManager()
		{
			super();
		}
		
		public var gameScene:IScene2D;
		
		override protected function onAdd():void{
			PBE.mainStage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMove);
		}
		
		private var lastMouseObject:DisplayObjectRenderer;
		protected function mouseMove(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var results:Array = new Array();
			var point:Point = new Point( PBE.mainStage.mouseX, PBE.mainStage.mouseY );
			var foundRenderers:Boolean = gameScene.getRenderersUnderPoint(point, results );
			var isMouseItem:Boolean = false;
			var currentMouseOver:DisplayObjectRenderer;
			
			if(results.length > 0){
				currentMouseOver = getMouseObject(results);
				var mouseComponent:MouseComponent =  getMouseComponent(currentMouseOver);
				if(mouseComponent && mouseComponent.isRegistered && mouseComponent.mouseEnabled){
					isMouseItem = true;
				}
				
			}
			if(!isMouseItem){
				if(lastMouseObject){
					rollOut(lastMouseObject);
					lastMouseObject = null;
				}
				return;
			}else{
				if(lastMouseObject == null){
					rollOver(currentMouseOver);
					lastMouseObject = currentMouseOver;
					return;
				}else if(lastMouseObject == currentMouseOver){
					
				}else{
					rollOut(lastMouseObject);
					rollOver(currentMouseOver);
					lastMouseObject = currentMouseOver;
				}
			}	
		}
		
		
		protected function getMouseObject(list:Array):DisplayObjectRenderer{
			return list.pop() as DisplayObjectRenderer;
		}
		
		protected override function onRemove():void
		{
			PBE.mainStage.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMove);
		}
		
		protected function getMouseComponent(item:DisplayObjectRenderer):MouseComponent{
			return item.owner.lookupComponentByType(MouseComponent) as MouseComponent;
		}
		
		private function rollOver(renderer:DisplayObjectRenderer):void{
			getMouseComponent(renderer).rollOver(renderer);
		}
		
		private function rollOut(renderer:DisplayObjectRenderer):void{
			getMouseComponent(renderer).rollOut(renderer);			
			
		}
		
		
	}
	
}