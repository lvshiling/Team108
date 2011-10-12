package com.qizhon.iso.components
{
	import as3isolib.core.IIsoDisplayObject;
	import as3isolib.geom.Pt;
	
	import com.pblabs.engine.PBUtil;
	import com.pblabs.engine.core.ObjectType;
	import com.pblabs.engine.debug.Logger;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.DisplayObjectRenderer;
	import com.pblabs.rendering2D.ICopyPixelsRenderer;
	import com.pblabs.rendering2D.IScene2D;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class MyIsoBaseComponent extends DisplayObjectRenderer implements IIsoComponent, ICopyPixelsRenderer
	{
		protected var _isoObject:IIsoDisplayObject;
		private var _isometricVolume:Pt;
		private var _debug:Boolean;
		private var _spatialComponentName:String;
		private var autoAssignRefs:Boolean;
		
		public var positionOffsetProperty:PropertyReference;
		public var isometricVolumeProperty:PropertyReference;
		public var resourcePropertyReference:PropertyReference;
		private var _optimize:Boolean;
		private var _bitmapHolder:Bitmap;
		public static const zeroPoint:Point = new Point();
		
		public function MyIsoBaseComponent(autoAssignRef:Boolean = false)
		{
			this._isometricVolume = new Pt();
			this._bitmapHolder = new Bitmap();
			this.autoAssignRefs = autoAssignRef;
			if (this.autoAssignRefs)
			{
				this._spatialComponentName = "Spatial";
			}
			_position = new Pt();
			_positionOffset = new Pt();
			return;
		}
		
		public function get isoComponent():IIsoDisplayObject
		{
			return this._isoObject;
		}
		
		public function get isometricVolume():Pt
		{
			return this._isometricVolume;
		}
		
		public function set isometricVolume(param1:Pt):void
		{
			this._isometricVolume = param1.clone() as Pt;
			this.isoComponent.setSize(this._isometricVolume.x, this._isometricVolume.z, this._isometricVolume.y);
		}
		
		
		override public function get x() : Number
		{
			return _position.x;
		}
		
		override public function set x(value:Number) : void
		{
			var posX:Number = NaN;
			
			if (snapToNearestPixels)
			{
				posX = int(value);
			}
			else
			{
				posX = value;
			}
			
			if (posX == Pt(_position).x)
				return;
			
			_position.x = posX;
			_transformDirty = true;
		}
		
		override public function get y() : Number
		{
			return _position.y;
		}
		
		override public function set y(value:Number) : void
		{
			var posY:Number = NaN;
			
			if (snapToNearestPixels)
			{
				posY = int(value);
			}
			else
			{
				posY = value;
			}
			
			if (posY == Pt(_position).y)
				return;
			
			_position.y = posY;
			_transformDirty = true;
		}
		
		public function get z() : Number
		{
			return Pt(_position).z;
		}
		
		public function set z(value:Number) : void
		{
			var posZ:Number = NaN;
			
			if (snapToNearestPixels)
			{
				posZ = int(value);
			}
			else
			{
				posZ = value;
			}
			
			if (posZ == Pt(_position).z)
				return;
			
			Pt(_position).z = posZ;
			_transformDirty = true;
		}
		
		
		override public function get positionOffset() : Point
		{
			return _positionOffset.clone() as Pt;
		}
		
		override public function set positionOffset(offset:Point) : void{
			var x:Number = NaN;
			var y:Number = NaN;
			var z:Number = NaN;
			if (!offset is Pt)
			{
				Logger.error(this, "set positionOffset", "The positionOffset must ne set using the AS3IsoLib Pt class. It needs the third Z dimension");
				return;
			}
			if (snapToNearestPixels)
			{
				x = int(Pt(offset).x);
				y = int(Pt(offset).y);
				z = int(Pt(offset).z);
			}
			else
			{
				x = Pt(offset).x;
				y = Pt(offset).y;
				z = Pt(offset).z;
			}
			if (x == _positionOffset.x && y == _positionOffset.y && z == Pt(_positionOffset).z)
			{
				return;
			}
			
			_positionOffset.x = x;
			_positionOffset.y = y;
			Pt(_positionOffset).z = z;
			_transformDirty = true;
		}
			
		override public function get position() : Point
		{
			return _position.clone() as Pt;
		}
		
		override public function set position(value:Point) : void
		{
			var x:Number = NaN;
			var y:Number = NaN;
			var z:Number = NaN;
			if (!value is Pt)
			{
				Logger.error(this, "set position", "The position must be set using the AS3IsoLib Pt class. It needs the third Z dimension");
				return;
			}
			if (snapToNearestPixels)
			{
				x = int(value.x);
				y = int(value.y);
				z = int(Pt(value).z);
			}
			else
			{
				x = value.x;
				y = value.y;
				z = Pt(value).z;
			}
			if (x == _positionOffset.x && y == _positionOffset.y && z == Pt(_positionOffset).z)
			{
				return;
			}
			_position.x = x;
			_position.y = y;
			Pt(_position).z = z;
			_transformDirty = true;
		}
		
		
		override public function get zIndex() : int
		{
			return this.isoComponent.distance;
		}
		
		override public function set zIndex(value:int) : void
		{
			_zIndex = value;
			this.isoComponent.distance = value;
		}
		
		public function get debug():Boolean
		{
			return this._debug;
		}
		
		public function set debug(value:Boolean):void
		{
			this._debug = value;
		}
		
		override public function get displayObject() : DisplayObject
		{
			return _displayObject;
		}
		public function get optimize() : Boolean
		{
			return this._optimize;
		}
		
		public function set optimize(value:Boolean) : void
		{
			this._optimize = value;
			if (this._optimize)
			{
				this._isoObject.isAnimated = false;
			}
			else
			{
				this._isoObject.isAnimated = true;
			}
		}
		
		override public function get scene() : IScene2D
		{
			return super.scene;
		}// end function
		
		override public function set scene(value:IScene2D) : void
		{
			super.scene = value;
		}
		
		
		
		
		override public function set displayObject(param1:DisplayObject) : void
		{
			Logger.error(this, "set displayObject", "Cannot set displayObject on an IsoComponent; it is always a Sprite containing the underlying AS3Iso Object\'s container");
		}
		
		public function get spatialComponentName():String
		{
			return this._spatialComponentName;
		}
		
		public function set spatialComponentName(value:String):void
		{
			if (value)
			{
				if (value.length == 0)
				{
					this.autoAssignRefs = false;
					this.cleanUpPropertyReferences();
				}
			}
			
			if (this._spatialComponentName != value)
			{
				this._spatialComponentName = value;
			}
			this.autoAssignRefs = true;
			this.wireUpPropertyReferences();
		}
		
		protected function wireUpPropertyReferences() : void
		{
			if (owner == null)
			{
				return;
			}
			if (!this._spatialComponentName)
			{
				return;
			}
			if (owner.lookupComponentByName(this.spatialComponentName))
			{
				this.isometricVolumeProperty = new PropertyReference("@" + this.spatialComponentName + ".isometricVolume");
				positionProperty = new PropertyReference("@" + this.spatialComponentName + ".position");
				this.positionOffsetProperty = new PropertyReference("@" + this.spatialComponentName + ".positionOffset");
				rotationProperty = new PropertyReference("@" + this.spatialComponentName + ".rotation");
			}
			else
			{
				if (this.isometricVolumeProperty != null)
				{
					this.isometricVolumeProperty = null;
				}
				if (positionProperty != null)
				{
					positionProperty = null;
				}
				if (this.positionOffsetProperty != null)
				{
					this.positionOffsetProperty = null;
				}
				if (rotationProperty != null)
				{
					rotationProperty = null;
				}
			}
			this.updateTransform(true);
			return;
		}
		
		protected function cleanUpPropertyReferences() : void
		{
			if (zIndexProperty)
			{
				zIndexProperty = null;
			}
			if (layerIndexProperty)
			{
				layerIndexProperty = null;
			}
			if (positionProperty)
			{
				positionProperty = null;
			}
			if (this.positionOffsetProperty)
			{
				this.positionOffsetProperty = null;
			}
			if (scaleProperty)
			{
				scaleProperty = null;
			}
			if (this.isometricVolumeProperty)
			{
				this.isometricVolumeProperty = null;
			}
			if (rotationProperty)
			{
				rotationProperty = null;
			}
			if (alphaProperty)
			{
				alphaProperty = null;
			}
			if (blendModeProperty)
			{
				blendModeProperty = null;
			}
			if (registrationPointProperty)
			{
				registrationPoint = null;
			}
			return;
		}
		
		/* From Bitmap Renderer */
		public function isPixelPathActive(objectToScreen:Matrix):Boolean
		{
			// No rotation/scaling/translucency/blend modes
			return (objectToScreen.a == 1 && objectToScreen.b == 0 && objectToScreen.c == 0 && objectToScreen.d == 1 && alpha == 1 && blendMode == BlendMode.NORMAL && (displayObject.filters.length == 0));
		}
		
		public function drawPixels(objectToScreen:Matrix, renderTarget:BitmapData):void
		{
			trace("Drawing!!");
			this._bitmapHolder.bitmapData = this.isoComponent.getRenderData().bitmapData;
			if (_bitmapHolder.bitmapData!=null)
				renderTarget.copyPixels(_bitmapHolder.bitmapData, _bitmapHolder.bitmapData.rect, objectToScreen.transformPoint(zeroPoint), null, null, true);
		}
		
		
		override protected function onAdd() : void
		{
			super.onAdd();
			if (_displayObject == null)
			{
				_displayObject = this._isoObject.container;
				//FlexGlobals.topLevelApplication.stage.addChild(_displayObject);
				addToScene();
			}
			/* Extra logic , need to be tested*/
			if (this.autoAssignRefs)
			{
				this.wireUpPropertyReferences();
			}
			this.attachLoadedResource();
			owner.eventDispatcher.addEventListener("resourceLoaded", this.resourceLoaded);
			return;
		}// end function
		
		override protected function onRemove() : void
		{
			super.onRemove();
			/* This need to be tested*/
			this.removeResourceData();
			this._debug = false;
			this._isoObject.removeAllChildren();
			this._isoObject = null;
			this.cleanUpPropertyReferences();
			if (this.resourcePropertyReference)
			{
				this.resourcePropertyReference = null;
			}
			owner.eventDispatcher.removeEventListener("resourceLoaded", this.resourceLoaded);
			return;
		}
		
		override protected function onReset() : void
		{
			if (this.autoAssignRefs)
			{
				this.wireUpPropertyReferences();
			}
			this.checkResourceExistence();
		}
		
		protected function resourceLoaded(event:Event) : void
		{
			this.attachLoadedResource();
		}// end function
		
		protected function attachLoadedResource() : void
		{
		}// 
		protected function removeResourceData() : void
		{
			return;
		}
		protected function checkResourceExistence() : void
		{
			if (this.resourcePropertyReference)
			{
				if (!owner.doesPropertyExist(this.resourcePropertyReference))
				{
					this.removeResourceData();
				}
			}
		}
		
		
		//Test this code 
		override public function updateTransform(updateProps:Boolean = false):void
		{
			if(!displayObject)
				return;
			
			if(updateProps)
				updateProperties();
			
			// If size is active, it always takes precedence over scale.
			var tmpScaleX:Number = _scale.x;
			var tmpScaleY:Number = _scale.y;
			if(_size)
			{
				var localDimensions:Rectangle = displayObject.getBounds(displayObject);
				tmpScaleX = _scale.x * (_size.x / localDimensions.width);
				tmpScaleY = _scale.y * (_size.y / localDimensions.height);
			}
			
			
			_transformMatrix.identity();
			_transformMatrix.scale(tmpScaleX, tmpScaleY);
			_transformMatrix.translate(-_registrationPoint.x * tmpScaleX, -_registrationPoint.y * tmpScaleY);
			_transformMatrix.rotate(PBUtil.getRadiansFromDegrees(_rotation) + _rotationOffset);
			_transformMatrix.translate(_position.x + _positionOffset.x, _position.y + _positionOffset.y);
			
			this.isoComponent.container.scaleX = _transformMatrix.a;
			this.isoComponent.container.scaleY = _transformMatrix.d;
			this.isoComponent.container.rotation = _rotation + _rotationOffset;
			this.isoComponent.moveTo(_transformMatrix.tx, _transformMatrix.ty, Pt(_position).z + Pt(_positionOffset).z);
			this.isoComponent.render();
			
			//displayObject.transform.matrix = _transformMatrix;
			displayObject.alpha = _alpha;
			displayObject.blendMode = _blendMode;
			displayObject.visible = (alpha > 0);
			
			_transformDirty = false;
		}
		
		override public function pointOccupied(worldPosition:Point, mask:ObjectType):Boolean
		{
			if (!displayObject || !scene)
				return false;
			
			// Sanity check.
			if(displayObject.stage == null)
				Logger.warn(this, "pointOccupied", "DisplayObject is not on stage, so hitTestPoint will probably not work right.");
			
			// This is the generic version, which uses hitTestPoint. hitTestPoint
			// takes a coordinate in screen space, so do that.
			
			//worldPosition = scene.transformWorldToScreen(worldPosition);
			worldPosition = scene.transformSceneToScreen(worldPosition);
			return displayObject.hitTestPoint(worldPosition.x, worldPosition.y, true);
		}
		
		public function getBounds(displayObject:DisplayObject) : Rectangle
		{
			return this._isoObject.getBounds(displayObject);
		}
		
		override protected function updateProperties() : void
		{
			var scale:Point = null;
			var rotation:Number = NaN;
			var alpha:Number = NaN;
			var blendMode:String = null;
			var registrationPoint:Point = null;
			if (!owner)
			{
				return;
			}
			
			if (zIndexProperty)
			{
				if (owner.doesPropertyExist(zIndexProperty))
				{
					this.zIndex = owner.getProperty(zIndexProperty, this.zIndex);
				}
			}
			
			if (positionProperty != null)
			{
				if (owner.doesPropertyExist(positionProperty))
				{
					this.position = owner.getProperty(positionProperty) as Pt;
				}
			}
			
			if (this.positionOffsetProperty != null)
			{
				if (owner.doesPropertyExist(this.positionOffsetProperty))
				{
					this.positionOffset = owner.getProperty(this.positionOffsetProperty) as Pt;
				}
			}
			
			if (scaleProperty)
			{
				if (owner.doesPropertyExist(scaleProperty))
				{
					scale = owner.getProperty(scaleProperty) as Point;
					if (scale)
					{
						this.scale = scale;
					}
				}
			}
			
			if (this.isometricVolumeProperty != null)
			{
				if (owner.doesPropertyExist(this.isometricVolumeProperty))
				{
					this.isometricVolume = owner.getProperty(this.isometricVolumeProperty) as Pt;
				}
			}
			
			if (rotationProperty)
			{
				if (owner.doesPropertyExist(rotationProperty))
				{
					rotation = owner.getProperty(rotationProperty) as Number;
					this.rotation = rotation;
				}
			}
			
			if (alphaProperty)
			{
				if (owner.doesPropertyExist(alphaProperty))
				{
					alpha = owner.getProperty(alphaProperty) as Number;
					this.alpha = alpha;
				}
			}
			if (blendModeProperty)
			{
				if (owner.doesPropertyExist(blendModeProperty))
				{
					blendMode = owner.getProperty(blendModeProperty) as String;
					this.blendMode = blendMode;
				}
			}
			if (registrationPointProperty)
			{
				if (owner.doesPropertyExist(registrationPointProperty))
				{
					registrationPoint = owner.getProperty(registrationPointProperty) as Point;
					if (registrationPoint)
					{
						registrationPoint = registrationPoint;
					}
				}
			}
			return;
			
		}
		
		public static function getFrom(param1:IEntity) : IIsoComponent
		{
			return param1.lookupComponentByType(MyIsoBaseComponent) as IIsoComponent;
		}
		
		
	}
}