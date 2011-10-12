package com.qizhon.controls
{
	import as3isolib.geom.IsoMath;
	import as3isolib.geom.Pt;
	import com.pblabs.animation.AnimationEvent;
	import com.pblabs.animation.Animator;
	import com.pblabs.animation.AnimatorComponent;
	import com.pblabs.animation.Tween;
	import com.pblabs.animation.TweenComponent;
	import com.pblabs.animation.TweenController;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.debug.Logger;
	import com.pblabs.engine.entity.EntityComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.AnimationController;
	import com.pblabs.rendering2D.IScene2D;
	import eDpLib.events.ProxyEvent;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import mx.core.FlexGlobals;
	import mx.effects.Zoom;
	import mx.events.EffectEvent;
	import mx.events.TweenEvent;
	import com.qizhon.iso.scene.IsoDisplayObjectScene;
	import com.qizhon.iso.scene.MyIsoSceneView;
	
	
	public class MousePanningSceneComponent extends EntityComponent
	{
		public function MousePanningSceneComponent()
		{
			super();
		}
		
		public var scene:IsoDisplayObjectScene;
		
		public var sceneView:MyIsoSceneView;
		/**
		 *  @private
		 *  Horizontal location where the user pressed the mouse button
		 *  on the canvas to start dragging.
		 */
		public var regX:Number;
		
		/**
		 *  @private
		 *  Vertical location where the user pressed the mouse button
		 *  on the canvas to start dragging.
		 */
		public var regY:Number;
		
		/**
		 *  @private
		 *  Private boolean to indicate whether mouse events on the child 
		 *  components should trigger dragging.
		 */
		private var _childrenDoDrag:Boolean = true;
		
		private var minimumXCoordinate:Number = 0
		private var minimumYCoordinate:Number = 0
		private var maximumXCoordinate:Number = 0
		private var maximumYCoordinate:Number = 0
		
		private var beforeDragXCoordinate:int = 0;
		private var beforeDragYCoordinate:int = 0;
		
		public  var leftTopOffset:Point = new Point;
		public  var rightBottomOffset:Point = new Point;
		
		public var isDragged:Boolean=false;
		
		
		
		/**
		 * @private
		 * Private Array of children that should NOT trigger dragging
		 */
		private var _undraggableChildren:Array=null;
		
		/**
		 * Array of child components that will not trigger the dragging. Only applicable if <code>childrenDoDrag</code>
		 * is true.
		 */
		public function get undraggableChildren():Array {
			return _undraggableChildren;
		}
		
		/**
		 * @public
		 */
		public function set undraggableChildren(value:Array):void {
			_undraggableChildren = value;
		}
		
		/**
		 * @private
		 */
		private var _undraggableClasses:Array=null;
		
		/**
		 * Array of Classes that will not trigger the dragging. Only applicable if <code>childrenDoDrag</code>
		 * is true.
		 */
		public function get undraggableClasses():Array {
			return _undraggableClasses;
		}
		
		/**
		 * @public
		 */
		public function set undraggableClasses(value:Array):void {
			_undraggableClasses = value;
		}
		
		public function get childrenDoDrag():Boolean {
			return this._childrenDoDrag;
		}
		public function set childrenDoDrag(value:Boolean):void {
			this._childrenDoDrag = value;
		}
		public var canPan:Boolean = true;
		
		public var isMouseDown:Boolean = false;
		
		public function get mainContainer():Sprite{
			return sceneView.mainContainer;
		}
		//Act as an construtor
		override protected function onAdd():void
		{
			if(!owner){
				Logger.error(this,"add","Owner not defined")
			}
			
			scene._isoScene.addEventListener(MouseEvent.MOUSE_DOWN, startDragging);
			calculateViewSettings();
			validate();
		}
		
		/**
		 * Please note that the container of isoscene view is exactly at the center of the screen
		 * 
		 **/
		protected function startDragging(event:ProxyEvent):void
		{
			// TODO Auto-generated method stub
			var mouseEvent:MouseEvent = MouseEvent(event.targetEvent);
			
			isMouseDown = true;
			beforeDragXCoordinate = mainContainer.x;
			beforeDragYCoordinate = mainContainer.y;
			
			
			if(_undraggableChildren != null)
			{
				for each(var child:* in _undraggableChildren)
				{
					if(event.target == child)
						return;
				}
			}
			
			if(_undraggableClasses != null)
			{
				for each(var testClass:Class in _undraggableClasses)
				{
					if(event.target is testClass)
						return;
				}
			}
			
			// If childrenDoDrag is set to true then we always do dragging on a mouse 
			// down event, we don't care what was clicked on. If childrenDoDrag is false 
			// then we only want to drag if we have been clicked directly.
			
			if(_childrenDoDrag || event.target == this) {
				regX = mouseEvent.stageX;
				regY = mouseEvent.stageY;
				scene.sceneView.addEventListener(
					MouseEvent.MOUSE_MOVE, mouseMove, true);
				
				scene.sceneView.addEventListener(
					MouseEvent.MOUSE_UP, mouseUp, true);
				
				scene.sceneView.addEventListener(
					Event.MOUSE_LEAVE, mouseLeave);
			}
			
		}
		
		private function mouseMove(event:MouseEvent):void
		{
			// TODO Auto Generated method stub
			if(isNaN(regX)|| isNaN(regY)){
				return;
			}
			var xToMove:Number = 0;
			var yToMove:Number = 0;
			
			if(beforeDragYCoordinate + (event.stageY - regY)/currentZoom < minimumYCoordinate){
				yToMove = minimumYCoordinate
			}else if(beforeDragYCoordinate + (event.stageY - regY)/currentZoom > maximumYCoordinate){
				yToMove = maximumYCoordinate
			}else{
				yToMove = beforeDragYCoordinate + (event.stageY - regY)/currentZoom;
			}
			
			if(beforeDragXCoordinate - (-event.stageX + regX)/currentZoom < minimumXCoordinate){
				xToMove= minimumXCoordinate;
			}else if(beforeDragXCoordinate - (-event.stageX + regX)/currentZoom > maximumXCoordinate){
				xToMove = maximumXCoordinate;
			}else{
				xToMove = beforeDragXCoordinate - (-event.stageX + regX)/currentZoom;
			}
			
			var pt:Pt = new Pt(xToMove,yToMove);
			sceneView.panTo(-pt.x,-pt.y);
		}
		
		public function validate():void{
			var xToMove:Number = 0;
			var yToMove:Number = 0;
			if (minimumXCoordinate > mainContainer.x)
			{
				xToMove = minimumXCoordinate
			}else if(maximumXCoordinate < mainContainer.x)
			{
				xToMove = maximumXCoordinate
			}
			if (minimumYCoordinate > mainContainer.y)
			{
				yToMove = minimumYCoordinate
			}else if(maximumYCoordinate < mainContainer.y)
			{
				yToMove = maximumYCoordinate
			}
			
			if(xToMove == 0){
				xToMove = mainContainer.x
					
			}
			if(yToMove == 0){
				yToMove = mainContainer.y
			}
			var pt:Pt = new Pt(xToMove,yToMove);
			sceneView.panTo(-pt.x,-pt.y);
			
		}
		
		private function mouseUp(event:MouseEvent):void
		{
			// TODO Auto Generated method stub
			isMouseDown = false;
			if (!isNaN(regX))
				stopDragging();
		}
		private function mouseLeave(event:Event):void
		{
			// TODO Auto Generated method stub
			isMouseDown = false;
			 if (!isNaN(regX)){
				stopDragging(); 
			 }
			
		}
		
		protected function get currentZoom():Number{
			return sceneView.currentZoom;
		}
		protected function stopDragging():void
		{
			scene.sceneView.removeEventListener(
				MouseEvent.MOUSE_MOVE, mouseMove, true);
			
			scene.sceneView.removeEventListener(
				MouseEvent.MOUSE_UP, mouseUp, true);
			
			scene.sceneView.removeEventListener(
				Event.MOUSE_LEAVE, mouseLeave);
			
			if(Math.abs(beforeDragXCoordinate - int(mainContainer.x))<10 && Math.abs(beforeDragYCoordinate - int(mainContainer.y))<10){
				isDragged = false;				
			}else{
				isDragged = true;
			}
			
			regX = NaN;
			regY = NaN;
		}
		
		override protected function onRemove():void
		{
			
		}
		
		protected function calculateViewSettings():void{
			changeMaxX(true);
			changeMaxY(true);
		}
		
		private function changeMaxX(isMapBigger:Boolean):void{
			if(isMapBigger){
				maximumXCoordinate = mainContainer.width/2-(PBE.mainClass.width/(2*currentZoom)) + rightBottomOffset.x/currentZoom;
				minimumXCoordinate = -mainContainer.width/2+(PBE.mainClass.width/(2*currentZoom)) - leftTopOffset.x/currentZoom;
			}else{
				
			}
		}
		private function changeMaxY(isMapBigger:Boolean):void{
			if(isMapBigger){
				maximumYCoordinate=  -PBE.mainClass.height/(2*currentZoom) + rightBottomOffset.y/currentZoom;
				minimumYCoordinate = - mainContainer.height +(PBE.mainClass.height/(2*currentZoom)) - leftTopOffset.y/currentZoom;
			}else{
				
			}
		}
		
		public function panTo(xTo:Number,yTo:Number):void{
			sceneView.panTo(xTo,yTo);
			validate();
		}
		
		private var isZoomPlaying:Boolean = false;
		private var duration:Number = 0;
		public function zoom(duration:int , level:Number):void
		{
			
			
			if(level <= 0){
				Logger.error(this,"zoom","Zoom Cannot be less than 0");
				return;
			}
			
			sceneView.zoom(level);
			calculateViewSettings();
			validate();
		}
		
	}
}