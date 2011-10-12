package com.qizhon.iso.scene
{
	import as3isolib.display.IsoView;
	import as3isolib.display.scene.IIsoScene;
	import as3isolib.geom.IsoMath;
	import as3isolib.geom.Pt;
	
	import com.pblabs.engine.PBE;
	import com.pblabs.rendering2D.ui.IUITarget;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	public class MyIsoSceneView extends IsoView implements IUITarget
	{
		protected var _isoView:IsoView;
		protected var _bgPos:Point;
		protected var _fgPos:Point;
		
		public function MyIsoSceneView()
		{
			if (PBE.mainClass)
			{
				if (!PBE.mainClass.contains(this))
				{
					PBE.mainClass.addChildAt(this, 0);
				}
				setSize(PBE.mainClass.width, PBE.mainClass.height);
				name = "IsoSceneView";
			}
			return;
		}// end function
		
		public function getSceneIndex(scene:IIsoScene) : int
		{
			var i:uint = 0;
			var len:uint = scenesArray.length;
			while (i < len)
			{
				
				if (scene == scenesArray[i])
				{
					return i;
				}
				i = i + 1;
			}
			return -1;
		}// end function
		
		public function transformScreenToWorld(param1:Point) : Point
		{
			return IsoMath.screenToIso(new Pt(param1.x, param1.y));
		}// end function
		
		public function addDisplayObject(param1:DisplayObject) : void
		{
			mContainer.addChild(param1);
			return;
		}// end function
		
		public function clearDisplayObjects() : void
		{
			while (mContainer.numChildren)
			{
				
				mContainer.removeChildAt(0);
			}
			return;
		}// end function
		
		public function removeDisplayObject(param1:DisplayObject) : void
		{
			if (mContainer.contains(param1))
			{
				mContainer.removeChild(param1);
			}
			return;
		}// end function
		
		public function setDisplayObjectIndex(param1:DisplayObject, param2:int) : void
		{
			mContainer.setChildIndex(param1, param2);
			return;
		}// end function
		
		override public function get width() : Number
		{
			return super.width;
		}// end function
		
		override public function set width(param1:Number) : void
		{
			this.width = param1;
		}// end function
		
		override public function get height() : Number
		{
			return super.height;
		}// end function
		
		override public function set height(param1:Number) : void
		{
			this.height = param1;
		}// end function
		
		public function get backgroundPosition() : Point
		{
			if (!this._bgPos)
			{
				this._bgPos = new Point();
				this._bgPos.x = this.backgroundContainer.x;
				this._bgPos.y = this.backgroundContainer.y;
			}
			return this._bgPos;
		}// end function
		
		public function set backgroundPosition(param1:Point) : void
		{
			this._bgPos = param1;
			this.backgroundContainer.x = this._bgPos.x;
			this.backgroundContainer.y = this._bgPos.y;
			this.invalidatePosition();
			return;
		}// end function
		
		public function get foregroundPosition() : Point
		{
			if (!this._fgPos)
			{
				this._fgPos = new Point();
				this._fgPos.x = this.foregroundContainer.x;
				this._fgPos.y = this.foregroundContainer.y;
			}
			return this._fgPos;
		}// end function
		
		public function set foregroundPosition(param1:Point) : void
		{
			this._fgPos = param1;
			this.foregroundContainer.x = this._fgPos.x;
			this.foregroundContainer.y = this._fgPos.y;
			this.invalidatePosition();
			return;
		}// end function
		
		public function get viewPosition() : Point
		{
			return new Point(currentScreenPt.x, currentScreenPt.y);
		}// end function
		
		public function set viewPosition(param1:Point) : void
		{
			panBy(param1.x, param1.y);
			return;
		}// end function
		
		override public function get currentX() : Number
		{
			return super.currentX;
		}// end function
		
		override public function set currentX(param1:Number) : void
		{
			super.currentX = param1;
			return;
		}// end function
		
		override public function get currentY() : Number
		{
			return super.currentY;
		}// end function
		
		override public function set currentY(param1:Number) : void
		{
			super.currentY = param1;
			return;
		}
	}
}