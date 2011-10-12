package
{
	import as3isolib.geom.Pt;
	import as3isolib.graphics.Stroke;
	
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.allocateEntity;
	import com.pblabs.rendering2D.BasicSpatialManager2D;
	import com.qizhon.iso.components.MyIsoGridComponent;
	import com.qizhon.iso.renderers.IsoSimpleSceneLayoutRenderer;
	import com.qizhon.iso.scene.IsoDisplayObjectScene;
	import com.qizhon.iso.scene.MyIsoSceneView;
	
	import flash.display.Sprite;

	[SWF (width="1000", height="800")]
	public class Team108 extends Sprite
	{
		private var defaultView:MyIsoSceneView;
		private var gameEntity:IEntity;
		public var firstisoScene:IsoDisplayObjectScene;
		public var basicSpatial:BasicSpatialManager2D;
		
		public function Team108()
		{
			start();
			initialize();
		}
		private function start():void
		{
			PBE.startup(this);
		}
		private function initialize():void
		{
			defaultView = new MyIsoSceneView();
			defaultView.name = "IsoView";
			defaultView.setSize(1000, 800);
			gameEntity = allocateEntity();
			gameEntity.initialize("IsoGame");
			
			basicSpatial = new BasicSpatialManager2D;
			gameEntity.addComponent(basicSpatial,"SpatialManager");
			
			firstisoScene = new IsoDisplayObjectScene();
			firstisoScene.sceneView = defaultView;
			firstisoScene.layoutRenderer = new IsoSimpleSceneLayoutRenderer();
			
			gameEntity.addComponent(firstisoScene,"Scene_0");
			
			var isoGrid:MyIsoGridComponent = new MyIsoGridComponent();
			isoGrid.cellSize = 40;
			isoGrid.gridSize = new Pt(4,4);
			isoGrid.gridStroke = new Stroke(1,0);
			isoGrid.scene = firstisoScene;
			isoGrid.showOrigin = false;
			isoGrid.zIndex = -1;
			
			gameEntity.addComponent(isoGrid,"IsoGrid");
		}
	}
}