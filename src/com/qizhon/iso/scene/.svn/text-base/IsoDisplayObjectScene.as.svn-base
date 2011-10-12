package com.qizhon.iso.scene
{
	import as3isolib.data.INode;
	import as3isolib.display.IsoView;
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.display.scene.IsoScene;
	import as3isolib.geom.IsoMath;
	import as3isolib.geom.Pt;
	
	import com.qizhon.iso.renderers.IIsoCustomRenderer;
	import com.qizhon.iso.renderers.IsoSceneLayoutRenderer;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.PBUtil;
	import com.pblabs.engine.core.ITickedObject;
	import com.pblabs.engine.core.ObjectType;
	import com.pblabs.engine.debug.Logger;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.rendering2D.DisplayObjectRenderer;
	import com.pblabs.rendering2D.DisplayObjectScene;
	import com.pblabs.rendering2D.DisplayObjectSceneLayer;
	import com.pblabs.rendering2D.ILayerMouseHandler;
	import com.pblabs.rendering2D.SceneAlignment;
	import com.pblabs.rendering2D.ui.IUITarget;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getQualifiedClassName;
	import com.qizhon.iso.components.IIsoComponent;
	import com.qizhon.iso.renderers.IsoSimpleSceneLayoutRenderer;
	
	public class IsoDisplayObjectScene extends DisplayObjectScene implements ITickedObject
	{
		public var _isoScene:IsoScene;
		protected var _layoutRenderer:IIsoCustomRenderer;
		protected var _localDisplayContainer:DisplayObjectContainer;
		public var displayObjectContainerProperty:PropertyReference;
		public static const COMPONENT_NAME:String = getQualifiedClassName(IsoDisplayObjectScene).replace("::", ".");
		
		public function IsoDisplayObjectScene()
		{
			updatePriority = -10;
			this._isoScene = new IsoScene();
		}
		
		public function onTick(deltaTime:Number):void
		{
			this.renderScene();
		}
		public function renderScene() : void
		{
			if (_sceneView)
			{
				if (MyIsoSceneView(_sceneView).scenes.length < 1)
				{
					return;
				}
				if (MyIsoSceneView(_sceneView).scenes[0] == this._isoScene)
				{
					MyIsoSceneView(_sceneView).render(true);
				}
			}
		}
		
		
		override public function add(dor:DisplayObjectRenderer) : void
		{
			if (dor is IIsoComponent)
			{
				if (dor.displayObject)
				{
					_renderers[dor.displayObject] = dor;
				}
				this.addIsoComponent(IIsoComponent(dor).isoComponent);
			} 
			else
			{
				Logger.error(this, "add", "you can not add a non IIsoComponent to this type of Scene");
			}
		}
		
		override public function remove(dor:DisplayObjectRenderer) : void
		{
			if (dor is IIsoComponent)
			{
				if (dor.displayObject)
				{
					delete _renderers[dor.displayObject];
				}
				this.removeIsoComponent(IIsoComponent(dor).isoComponent);
			}
			else
			{
				Logger.error(this, "remove", "you can not remove a non IIsoComponent from this Scene. There should not have been an non IIsoComponent added.");
			}
			return;
		}
		
		protected function addIsoComponent(component:INode) : void
		{
			if (this._isoScene)
			{
				this._isoScene.addChild(component);
				this._isoScene.render();
			}
			return;
		}// end function
		
		protected function removeIsoComponent(component:INode) : void
		{
			if (this._isoScene)
			{
				this._isoScene.removeChild(component);
			}
			return;
		}
		
		override protected function onAdd() : void
		{
			//_layoutRenderer = new IsoSceneLayoutRenderer();
			_layoutRenderer = new IsoSimpleSceneLayoutRenderer();
			_isoScene.layoutRenderer = _layoutRenderer;
			
			_rootSprite = _isoScene.container;
			
			super.onAdd();
			
			PBE.processManager.addTickedObject(this);
		}
		
		override protected function onRemove() : void
		{
			_isoScene.removeAllChildren();
			_isoScene.hostContainer = null;
			this._rootSprite = null;
			this.displayContainer = null;
			this.displayObjectContainerProperty = null;
			if (_layoutRenderer != null)
			{
				this._layoutRenderer.destroy();
				this.layoutRenderer = null;
			}
			_isoScene.removeAllChildren();
			IsoView(this._sceneView).removeScene(this._isoScene);
			this._isoScene = null;
			this._sceneView = null;
			super.onRemove();
			PBE.processManager.removeTickedObject(this);
		}
		override protected function onReset() : void
		{
			super.onReset();
			if (this._isoScene.hostContainer != null)
			{
				this._isoScene.hostContainer = null;
			}
			this._isoScene.invalidateScene();
			return;
		}
		
		
		override public function screenPan(xBy:int, yBy:int) : void
		{
			if (_sceneView)
			{
				MyIsoSceneView(_sceneView).panBy(xBy, yBy);
			}
			else
			{
				super.screenPan(xBy, yBy);
			}
			return;
		}
		
		
		//@Check
		override public function updateTransform() : void
		{
			if (!this.sceneView)
			{
				return;
			}
			if (_transformDirty == false)
			{
				return;
			}
			_transformDirty = false;
			_rootSprite.rotation = _rootRotation;
			
			/*if (_rootPosition.x == 0 && _rootPosition.y == 0)
			{
				this.resetScenePosition();
			}*/
			_rootSprite.x = _rootPosition.x;
			_rootSprite.y = _rootPosition.y;
			return;
		}
		public function resetScenePosition() : void
		{
			SceneAlignment.calculate(_rootPosition, sceneAlignment, this.sceneView.width, this.sceneView.height);
			_rootSprite.x = _rootPosition.x;
			_rootSprite.y = _rootPosition.y;
			return;
		}
		override public function sortSpatials(param1:Array) : void
		{
			Logger.error(this, "sortSpatials", "sortSpatials(array) - Sorting of Isometric Objects is handled by the layoutRenderer of the scene");
		}// end function
		
		
		override public function onFrame(param1:Number) : void
		{
			var _loc_2:Pt = null;
			var _loc_3:Rectangle = null;
			if (!this.sceneView)
			{
				Logger.warn(this, "onFrame", "sceneView is null, so we aren\'t rendering.");
				return;
			}
			if (!trackObject is IIsoComponent)
			{
				Logger.error(this, "onFrame", "The tracked Object must be an IIsoComponent");
				return;
			}
			if (trackObject)
			{
				Logger.warn(this, "onFrame", "The trackObject functionality currently does not work correctly.");
			}
			if(trackLimitRectangle != null)
			{
				var centeredLimitBounds:Rectangle = new Rectangle( trackLimitRectangle.x     + sceneView.width * 0.5, trackLimitRectangle.y      + sceneView.height * 0.5,
					trackLimitRectangle.width - sceneView.width      , trackLimitRectangle.height - sceneView.height );
				
				position = new Point(PBUtil.clamp(position.x, -centeredLimitBounds.right, -centeredLimitBounds.left ), 
					PBUtil.clamp(position.y, -centeredLimitBounds.bottom, -centeredLimitBounds.top) );
			}
			//@check
			updateTransform();
		}
		
		
		override public function transformScreenToWorld(point:Point) : Point
		{
			this.updateTransform();
			return IsoMath.screenToIso(new Pt(point.x, point.y));
		}// end function
		
		override public function transformWorldToScreen(point:Point) : Point
		{
			var newPt:Pt;
			this.updateTransform();
			if (point is Point)
			{
				newPt = new Pt(point.x, point.y);
			}
			else
			{
				newPt = point as Pt;
			}
			return IsoMath.isoToScreen(newPt);
		}
		
		public function getBounds(param1:DisplayObject) : Rectangle
		{
			return this._isoScene.container.getBounds(param1);
		}
		
		public function get layoutEnabled() : Boolean
		{
			return this._isoScene.layoutEnabled;
		}// end function
		
		public function set layoutEnabled(param1:Boolean) : void
		{
			this._isoScene.layoutEnabled = param1;
			return;
		}
		public function set layoutRenderer(renderer:IIsoCustomRenderer) : void
		{
			if (this._layoutRenderer != null)
			{
				this._layoutRenderer.destroy();
			}
			this._layoutRenderer = renderer;
			this._isoScene.layoutRenderer = this._layoutRenderer;
		}
		public function get stylingEnabled() : Boolean
		{
			return this._isoScene.stylingEnabled;
		}
		
		public function set stylingEnabled(value:Boolean) : void
		{
			this._isoScene.stylingEnabled = value;
		}
		
		public function get styleRenderers() : Array
		{
			return this._isoScene.styleRenderers;
		}
		
		public function set styleRenderers(renderers:Array) : void
		{
			this._isoScene.styleRenderers = renderers;
		}
		
		override public function set zoom(value:Number) : void
		{
			super.zoom = value;
		}
		
		override public function get sceneView() : IUITarget
		{
			return super.sceneView;
		}
		
		override public function set sceneView(value:IUITarget) : void
		{
			if (!value)
			{
				return;
			}
			if (!value is MyIsoSceneView)
			{
				Logger.warn(this, "sceneView", "You should only use an IsoSceneView with this type of component");
			}
			
			_sceneView = value;
			if (value is MyIsoSceneView)
			{
				_sceneViewName = (value as MyIsoSceneView).name;
				(value as MyIsoSceneView).addScene(this._isoScene);
			}
			this.updateTransform();
			return;
		}
		
		public function set isoSceneView(value:MyIsoSceneView) : void
		{
			Logger.error(this, "isoSceneView", "This setter has been deprecated, please use the sceneView setter");
			return;
		}
		
		public function get displayContainer() : DisplayObjectContainer
		{
			if (this.displayObjectContainerProperty != null)
			{
				return owner.getProperty(this.displayObjectContainerProperty) as DisplayObjectContainer;
			}
			return this._localDisplayContainer;
		}
		
		public function set displayContainer(value:DisplayObjectContainer) : void
		{
			this._localDisplayContainer = value;
			if (this._localDisplayContainer != null)
			{
				this._isoScene.hostContainer = this._localDisplayContainer;
			}
			return;
		}
		
		public static function getFrom(entity:IEntity) : IsoDisplayObjectScene
		{
			return entity.lookupComponentByName(COMPONENT_NAME) as IsoDisplayObjectScene;
		}
		
		override public function getRenderersUnderPoint(screenPosition:Point, results:Array, mask:ObjectType = null):Boolean
		{
			// Query normal DO hierarchy.
			
			//hack fix it later
			var unfilteredResults:Array = _rootSprite.parent.parent.parent.getObjectsUnderPoint(screenPosition);
			var scenePosition:Point = transformScreenToScene(screenPosition);
			
			for each (var o:* in unfilteredResults)
			{
				var renderer:DisplayObjectRenderer = getRendererForDisplayObject(o);
				
				if(!renderer)
					continue;
				
				if(!renderer.owner)
					continue;
				
				if(mask && !PBE.objectTypeManager.doTypesOverlap(mask, renderer.objectMask))
					continue;
				
				if(!renderer.pointOccupied(scenePosition, mask))
					continue;
				
				results.push(renderer);
			}
			// Also give layers opportunity to return renderers.
			scenePosition = transformScreenToScene(screenPosition);
			for each(var l:DisplayObjectSceneLayer in _layers)
			{
				// Skip them if they don't use the interface.
				if(!(l is ILayerMouseHandler))
					continue;
				
				(l as ILayerMouseHandler).getRenderersUnderPoint(scenePosition, mask, results);
			}
			return results.length > 0 ? true : false;
		}
		
	}
}