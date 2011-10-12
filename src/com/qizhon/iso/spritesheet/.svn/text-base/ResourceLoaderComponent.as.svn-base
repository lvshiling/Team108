package com.qizhon.iso.spritesheet
{
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.debug.Logger;
	import com.pblabs.engine.resource.ImageResource;
	import com.pblabs.engine.resource.Resource;
	import com.pblabs.engine.resource.SWFResource;
	
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	public class ResourceLoaderComponent extends TickedComponent
	{
		
		protected var _fileName:String;
		protected var _compProp:String;
		protected var _className:String;
		protected var _resourceType:String;
		protected var _resourceTypeClass:Class;
		protected var _resource:Resource;
		protected var _containingObjectName:String;
		private var _unloaded:Boolean = true;
		
		public function ResourceLoaderComponent()
		{
			super();
		}
		
		public function clear() : void
		{
			this.clearResource();
			return;
		}
		
		
		//@check
		override public function onTick(value:Number) : void
		{
			super.onTick(value);
			if(!owner){
				return;
			}
			if (this._fileName && this._resourceType)
			{
				if (!this._resourceTypeClass)
				{
					this._resourceTypeClass = getDefinitionByName(this._resourceType) as Class;
				}
				if (!PBE.resourceManager.isLoaded(this._fileName, this._resourceTypeClass))
				{
					this.clearResource();
				}
			}
			return;
		}
		
		override protected function onAdd() : void
		{
			super.onAdd();
			this.loadResource();
			return;
		}
		
		override protected function onRemove() : void
		{
			this.clearResource();
			this._resourceTypeClass = null;
			super.onRemove();
			return;
		}
		override protected function onReset() : void
		{
			super.onReset();
			return;
		}
		
		//@Check
		protected function onResourceLoaded(loadedResource:Resource) : void
		{
			/*if (!owner)
			{
				return;
			}
			if (value)
			{
			}*/
			if(!owner){
				return;
			}
			
			if (loadedResource && this._resource == null)
			{
				this._resource = loadedResource;
				if (this._resource.isLoaded)
				{
					owner.eventDispatcher.dispatchEvent(new Event("resourceLoaded"));
					this._unloaded = false;
				}
				else
				{
					this._resource = null;
					this._unloaded = true;
				}
			}
			return;
		}
		
		protected function onResourceFailed(resource:Resource) : void
		{
			Logger.error(this, "onResourceFailed", "Failed to load \'" + (resource ? (resource.filename) : ("(unknown)")) + "\'");
			return;
		}
		//@Check
		protected function loadResource() : void
		{
			var _class:Class = null;
			var resource:Resource = null;
			if(!owner || _resource || !_unloaded){
				return;
			}
			/*if (!owner)
			{
			return;
			}
			if (this._resource)
			{
			return;
			}
			if (!this._unloaded)
			{
			return;
			}
			if (this._fileName)
			{
			}*/
			
			if (_fileName && this._resourceType)
			{
				_class = Class(getDefinitionByName(this._resourceType));
				resource = PBE.resourceManager.load(this._fileName, _class, this.onResourceLoaded, this.onResourceFailed);
				if (resource)
				{
					this.onResourceLoaded(resource);
				}
			}
			return;
		}
		
		protected function clearResource() : void
		{
			if (this._unloaded)
			{
				return;
			}
			owner.eventDispatcher.dispatchEvent(new Event("resourceUnloaded"));
			this._resource = null;
			this._unloaded = true;
			return;
		}
		
		public function get fileUrl() : String
		{
			return this._fileName;
		}
		
		public function set fileUrl(param1:String) : void
		{
			if (this._resource)
			{
				this.clearResource();
			}
			this._fileName = param1;
			this.loadResource();
			return;
		}
		
		public function get resourceType() : String
		{
			return this._resourceType;
		}
		
		public function set resourceType(value:String) : void
		{
			if (this._resource)
			{
				this.clearResource();
			}
			this._resourceType = value;
			this.loadResource();
		}
		
		public function get containingObjectName() : String
		{
			return this._containingObjectName;
		}
		
		public function set containingObjectName(value:String) : void
		{
			this._containingObjectName = value;
		}
		
		public function get resourceContent():Object
		{
			/*if (this.resource)
			{
			}
			if (!this.resource.isLoaded)
			{
				return null;
			}*/
			if (!this.resource || !this.resource.isLoaded)
			{
				return null;
			}
			
			if (this.resource is SWFResource)
			{
				if (!this.containingObjectName)
				{
					return (this.resource as SWFResource).clip;
				}
				if ((this.resource as SWFResource).appDomain)
				{
					return (this.resource as SWFResource).getAssetClass(this._containingObjectName);
				}
				Logger.error(this, "resourceContent", "The SWF resource is missing domain information, so it can not be extracted.");
			}
			else if (this.resource is ImageResource)
			{
				if (!(this.resource as ImageResource).bitmapData)
				{
					Logger.error(this, "resourceContent", "The Image resource is missing bitmapData information, so it can not be used.");
				}
				else
				{
					return (this.resource as ImageResource).bitmapData;
				}
			}
			return null;
		}
		
		public function get resource() : Resource
		{
			return this._resource;
		}
		
	}
}