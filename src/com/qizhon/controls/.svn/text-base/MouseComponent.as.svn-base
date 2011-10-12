package com.qizhon.controls
{
	import com.pblabs.engine.entity.EntityComponent;
	import com.pblabs.rendering2D.DisplayObjectRenderer;
	
	import flash.filters.GlowFilter;
	
	public class MouseComponent extends EntityComponent
	{
		public function MouseComponent()
		{
			super();
		}
		
		public var mouseEnabled:Boolean = true;
		
		public static function get f_364f02():GlowFilter{
			return new GlowFilter(0x364f02,1,3,3,10);
		}
		
		public function rollOver(renderer:DisplayObjectRenderer):void{
			
			renderer.displayObject.filters = [f_364f02];
		}
		
		public function rollOut(renderer:DisplayObjectRenderer):void{
			renderer.displayObject.filters = [];
		}
	}
	
}