package com.qizhon.iso.components
{
	import as3isolib.geom.Pt;
	
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.core.ObjectType;
	import com.pblabs.rendering2D.DisplayObjectRenderer;
	import com.pblabs.rendering2D.IScene2D;
	import com.pblabs.rendering2D.ISpatialManager2D;
	import com.pblabs.rendering2D.RayHitInfo;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class MyIsoSpatialComponent extends TickedComponent implements IIsoSpatialObject
	{
		private var _objectMask:ObjectType;
		private var _spatialManager:ISpatialManager2D;
		public var spriteForPointChecks:DisplayObjectRenderer;
		private var _position:Pt;
		private var _positionOffset:Pt;
		private var _rotation:Number = 0;
		private var _isometricVolume:Pt;
		
		public function MyIsoSpatialComponent()
		{
			this._position = new Pt(0, 0, 0);
			this._positionOffset = new Pt(0, 0, 0);
			this._isometricVolume = new Pt(100, 100, 100);
		}
		
		
		public function get position() : Pt
		{
			return this._position;
		}
		
		public function set position(position:Pt) : void
		{
			this._position = position;
		}
		
		public function get positionOffset() : Pt
		{
			return this._positionOffset;
		}
		
		public function set positionOffset(offset:Pt) : void
		{
			this._positionOffset = offset;
		}
		
		public function get rotation() : Number
		{
			return this._rotation;
		}
		
		public function set rotation(rotation:Number) : void
		{
			this._rotation = rotation;
		}
		
		
		public function get isometricVolume() : Pt
		{
			return this._isometricVolume;
		}
		
		public function set isometricVolume(volume:Pt) : void
		{
			this._isometricVolume = volume;
		}
		
		public function get spatialManager():ISpatialManager2D
		{
			return this._spatialManager;
		}
		
		public function get objectMask():ObjectType
		{
			return _objectMask;
		}
		
		public function set objectMask(value:ObjectType):void
		{
			_objectMask = value;
		}
		
		/**
		 * 
		 * Check Simple Spatial Component , Use the same logic
		 * 
		 * */
		public function set spatialManager(spatialManager:ISpatialManager2D):void
		{
			if (!isRegistered){
				this._spatialManager = spatialManager;
				return;
			}
			
			if (_spatialManager)
				this._spatialManager.removeSpatialObject(this);
			
			_spatialManager = spatialManager;
			
			if (this._spatialManager)
				this._spatialManager.addSpatialObject(this);
		}
		
		/**
		 * 
		 * Check Simple Spatial Component , Used the same logic
		 * 
		 * */
		public function get worldExtents():Rectangle
		{
			return new Rectangle(this.position.x - this.isometricVolume.x * 0.5, this.position.y - this.isometricVolume.y * 0.5, this.isometricVolume.x, this.isometricVolume.y);
		}
		
		
		
		public function castRay(start:Point, end:Point, flags:ObjectType, result:RayHitInfo):Boolean
		{
			return false;
		}
		
		public function pointOccupied(pos:Point, mask:ObjectType, scene:IScene2D):Boolean
		{
			// If no sprite then we just test our bounds.
			if(!spriteForPointChecks || !scene)
				return worldExtents.containsPoint(pos);
			
			// OK, so pass it over to the sprite.
			return spriteForPointChecks.pointOccupied(scene.transformWorldToScreen(pos), mask);
		}
		
		override protected function onAdd():void
		{
			super.onAdd();
			
			if (_spatialManager)
				_spatialManager.addSpatialObject(this);
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function onRemove():void
		{
			super.onRemove();
			
			if (_spatialManager)
				_spatialManager.removeSpatialObject(this);
		}
	}
}