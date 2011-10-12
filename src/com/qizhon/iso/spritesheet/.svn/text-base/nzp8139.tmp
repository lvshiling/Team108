package com.qizhon.iso.spritesheet
{
	import com.pblabs.engine.core.ObjectType;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.ICopyPixelsRenderer;
	import com.pblabs.rendering2D.spritesheet.BasicSpriteSheetComponent;
	import com.pblabs.rendering2D.spritesheet.ISpriteSheet;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.display.PixelSnapping;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import com.qizhon.iso.components.MyIsoSpriteComponent;
	
	
	public class IsoSpriteSheetComponent extends MyIsoSpriteComponent implements ICopyPixelsRenderer
	{
		
		protected var _smoothing:Boolean = false;
		private var _setRegistration:Boolean = false;
		
		//shoujld be a refrence to a basic spritesheetcomponent
		public var spriteSheetReference:PropertyReference;
		public var spriteSheet:ISpriteSheet;
		public var spriteIndex:int = 0;
		public var directionReference:PropertyReference;
		public var direction:Number = 0;
		public static const zeroPoint:Point = new Point();
		
		public function IsoSpriteSheetComponent(autoAssignRefs:Boolean=false)
		{
			super(autoAssignRefs);
			this._smoothing = true;
			optimize = false;
		}
		
		override public function onFrame(param1:Number) : void
		{
			super.onFrame(param1);
			var targetBitmapData:BitmapData = this.getCurrentFrame();
			if (this.bitmapData !== targetBitmapData)
			{
				this.bitmapData = targetBitmapData;
			}
			return;
		}
		
		override protected function onRemove() : void
		{
			if (this.spriteSheet)
			{
				this.spriteSheet.destroy();
				this.spriteSheet = null;
			}
			this.spriteSheetReference = null;
			this.directionReference = null;
			super.onRemove();
			return;
		}
		
		override public function isPixelPathActive(objectToScreen:Matrix):Boolean
		{
			// No rotation/scaling/translucency/blend modes
			return (objectToScreen.a == 1 && objectToScreen.b == 0 && objectToScreen.c == 0 && objectToScreen.d == 1 && alpha == 1 && blendMode == BlendMode.NORMAL && (displayObject.filters.length == 0));
		}
		
		override public function drawPixels(param1:Matrix, renderTarget:BitmapData) : void
		{
			renderTarget.copyPixels(Bitmap(_spriteObj).bitmapData, Bitmap(_spriteObj).bitmapData.rect, param1.transformPoint(zeroPoint), null, null, true);
			return;
		}
		
		//@Check
		override public function pointOccupied(worldPosition:Point, mask:ObjectType) : Boolean
		{
			if (!Bitmap(_spriteObj) || !Bitmap(_spriteObj).bitmapData)
			{
				return false;
			}
			//var localPos:Point = transformWorldToObject(worldPosition);
			var worldPosition:Point= scene.transformSceneToScreen(worldPosition);
			worldPosition = _spriteObj.globalToLocal(worldPosition)
			return Bitmap(_spriteObj).bitmapData.hitTest(zeroPoint, 0x01, worldPosition);
		}
		
		
		//@Check
		override protected function attachLoadedResource() : void
		{
			var resourceData:BitmapData = null;
			if(owner){
				if(!_spriteObj){
					if(spriteSheet && (spriteSheet is BasicSpriteSheetComponent))
					{
						if(!resourcePropertyReference)return;
						resourceData = owner.getProperty(resourcePropertyReference) as BitmapData;
						if(!resourceData)return;
						(this.spriteSheet as BasicSpriteSheetComponent).imageData = resourceData;
					}
				}
			}
		} 
		
		
		//@Check
		protected function getCurrentFrame() : BitmapData
		{
			if(!spriteSheet && spriteSheetReference){
				spriteSheet = owner.getProperty(this.spriteSheetReference) as ISpriteSheet;
			}
			if(!spriteSheet || !spriteSheet.isLoaded){
				return null;
			}
			
			
			if ( spriteSheet && spriteSheet.isLoaded && spriteSheet.centered)
			{
				registrationPoint = spriteSheet.center.clone();
				registrationPoint.x = registrationPoint.x * -1;
				registrationPoint.y = registrationPoint.y * -1;
			}
			
			_setRegistration = true;
			if (this.directionReference && owner.doesPropertyExist(this.directionReference))
			{
				this.direction = owner.getProperty(this.directionReference) as Number;
			}else{
				this.direction = 0;
			}
			return this.spriteSheet.getFrame(this.spriteIndex, this.direction);
		}
		
		public function get bitmapData() : BitmapData
		{
			if (_spriteObj)
			{
				return Bitmap(_spriteObj).bitmapData;
			}
			return null;
		}// end function
		
		public function set bitmapData(value:BitmapData) : void
		{
			if (value == null)
			{
				return;
			}
			spriteOffset = new Point(-this.spriteSheet.center.x, -this.spriteSheet.center.y);
			sprite = value;
			Bitmap(_spriteObj).pixelSnapping = PixelSnapping.AUTO;
			this.smoothing = this._smoothing;
			_transformDirty = true;
		}// end function
		
		public function get smoothing() : Boolean
		{
			return this._smoothing;
		}// end function
		
		public function set smoothing(param1:Boolean) : void
		{
			this._smoothing = param1;
			if (_spriteObj)
			{
				Bitmap(_spriteObj).smoothing = param1;
			}
			return;
		}
		
	}
}