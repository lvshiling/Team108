package com.qizhon.iso.components
{
	import avmplus.getQualifiedClassName;
	
	import com.qizhon.utils.IsoUtils;
	import com.pblabs.engine.debug.Logger;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;

	public class MyIsoSpriteComponent extends MyIsoBaseComponent
	{
		protected var _spriteObj:DisplayObject;
		public var spriteOffset:Point;
		public static const COMPONENT_NAME:String = getQualifiedClassName(MyIsoSpriteComponent).replace("::", ".");
		
		public function MyIsoSpriteComponent(param1:Boolean = false)
		{
			this.spriteOffset = new Point();
			super(param1);
			_isoObject = new MyIsoBoxSprite();
			optimize = true;
			return;
		}
		
		public function addSprite(sprite:DisplayObject, offset:Point = null) : void
		{
			this.sprite = sprite;
			if (offset)
			{
				this.spriteOffset = offset;
			}
			return;
		}
		
		override protected function attachLoadedResource() : void{
			var resource:DisplayObject = null;
			super.attachLoadedResource();
			if (owner)
			{
				if (this._spriteObj)
				{
					this.removeResourceData();
				}
				if (!resourcePropertyReference)
				{
					return;
				}
				resource = owner.getProperty(resourcePropertyReference);
				if (!resource)
				{
					return;
				}
				this.sprite = resource;
			}
		}
		
		override protected function removeResourceData() : void
		{
			super.removeResourceData();
			if (resourcePropertyReference)
			{
				if (this._spriteObj)
				{
					_isoObject.container.removeChild(this._spriteObj);
					this._spriteObj = null;
				}
			}
		}
		override protected function updateProperties() : void
		{
			super.updateProperties();
			if (this._spriteObj)
			{
				this._spriteObj.x = this.spriteOffset.x;
				this._spriteObj.y = this.spriteOffset.y;
			}
			return;
		}
		
		/**
		 * 
		 * 
		 * */
		public function set sprite(param1:Object) : void
		{
			var _loc_3:Bitmap = null;
			var _loc_4:* = undefined;
			var _loc_2:Boolean = false;
			if (this._spriteObj)
			{
				if (param1 is BitmapData)
				{
					_loc_2 = true;
				}
				else
				{
					_isoObject.container.removeChild(this._spriteObj);
				}
			}
			if (param1 is BitmapData)
			{
				if (this._spriteObj)
				{
					if (param1 === Bitmap(this._spriteObj).bitmapData)
					{
						return;
					}
				}
				if (_loc_2)
				{
					Bitmap(this._spriteObj).bitmapData = param1 as BitmapData;
				}
				else
				{
					_loc_3 = new Bitmap(BitmapData(param1));
					_loc_3.cacheAsBitmap = true;
					this._spriteObj = _loc_3;
				}
			}
			else if (param1 is DisplayObject)
			{
				if (param1 is MovieClip)
				{
					IsoUtils.stopMovieClips(param1 as MovieClip);
				}
				this._spriteObj = DisplayObject(param1);
			}
			else if (param1 is Class)
			{
				_loc_4 = new param1;
				if (_loc_4 is MovieClip)
				{
					IsoUtils.stopMovieClips(_loc_4);
				}
				if (_loc_4 is BitmapData)
				{
					this._spriteObj = new Bitmap(BitmapData(_loc_4));
				}
				else
				{
					this._spriteObj = DisplayObject(_loc_4);
				}
			}
			else
			{
				this._spriteObj = null;
				Logger.error(this, "addSprite", "skin asset is not of the following types: BitmapData, DisplayObject, ISpriteAsset, IFactory or Class cast as DisplayOject.");
				return;
			}
			_isoObject.container.addChild(this._spriteObj);
		}
			
	}
}