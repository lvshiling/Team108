package scene
{
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.geom.IsoMath;
	import as3isolib.geom.Pt;
	import as3isolib.graphics.Stroke;
	
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.engine.entity.allocateEntity;
	import com.pblabs.rendering2D.BasicSpatialManager2D;
	import com.pblabs.rendering2D.DisplayObjectScene;
	import com.pblabs.rendering2D.SceneAlignment;
	import com.pblabs.rendering2D.SimpleSpatialComponent;
	import com.pblabs.rendering2D.SpriteRenderer;
	import com.pblabs.rendering2D.spritesheet.SpriteContainerComponent;
	import com.pblabs.screens.ScreenManager;
	import com.qizhon.controls.MouseManager;
	import com.qizhon.controls.MousePanningSceneComponent;
	import com.qizhon.i.Imdr;
	import com.qizhon.iso.components.MyIsoGridComponent;
	import com.qizhon.iso.components.MyIsoSpatialComponent;
	import com.qizhon.iso.components.MyIsoSpriteComponent;
	import com.qizhon.iso.renderers.IsoSimpleSceneLayoutRenderer;
	import com.qizhon.iso.scene.IsoDisplayObjectScene;
	import com.qizhon.iso.scene.MyIsoSceneView;
	import com.qizhon.iso.spritesheet.IsoSpriteSheetComponent;
	import com.qizhon.utils.IsoUtils;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class BattleSceneMdr implements Imdr
	{
		private var battleBg:IEntity;
		private var battleScene:BattleScene;
		private var defaultView:MyIsoSceneView;
		private var gameEntity:IEntity;
		public var basicSpatial:BasicSpatialManager2D;
		public static var isoGameScene:IsoDisplayObjectScene;
		private var mousepanning:MousePanningSceneComponent;
		private var mouseComponent:MouseManager;
		private var debugGrid:MyIsoGridComponent;
		private var isoGridA:MyIsoGridComponent;
		private var isoGridB:MyIsoGridComponent;
		private var isoGridC:MyIsoGridComponent;
		private var isoGridD:MyIsoGridComponent;
		private var isoGridE:MyIsoGridComponent;
		
		public var WIDTH:uint = 1500;
		public var HEIGHT:uint = 900;
		
		[Embed(source="assets/13_1.swf" ,  symbol="cco")]
		public var worker:Class;
		[Embed(source="assets/battle/map/world_default.jpg")]
		public var bgCls:Class;
		
		public function BattleSceneMdr(scene:BattleScene)
		{
			battleScene = scene;
			initialize();
			addListener();
		}
		
		public function initialize():void
		{
			defaultView = new MyIsoSceneView();
			defaultView.name = "IsoView";
			defaultView.setSize(WIDTH, HEIGHT);
			isoGameScene = new IsoDisplayObjectScene();
			isoGameScene.sceneView = defaultView;
			isoGameScene.layoutRenderer = new IsoSimpleSceneLayoutRenderer();
			
			gameEntity = allocateEntity();
			gameEntity.initialize("IsoGame");
			
			gameEntity.addComponent(isoGameScene, "Scene_0");	
			
			basicSpatial = new BasicSpatialManager2D;
			gameEntity.addComponent(basicSpatial, "SpatialManager");
			
			mouseComponent = new MouseManager;
			mouseComponent.gameScene = isoGameScene;
			gameEntity.addComponent(mouseComponent, "mouseComponent");
			
			layoutBg();
			layoutGrid();
		}
		
		public function cleanUp():void
		{
			gameEntity.destroy();
			
		}
	
		/** 
		 *  A     B  
		 * 	   E
		 *  D     C
		 */	
		private function layoutBg():void
		{
			var bgPos:Point = new Point(-750, -450);
			//bgPos = IsoMath.screenToIso(new Pt(-WIDTH/2, -HEIGHT/2));
			defaultView.backgroundContainer.addChild(new bgCls);
			defaultView.backgroundPosition = bgPos;
		}
		
		private function layoutGrid():void
		{
			debugGrid = new MyIsoGridComponent();
			debugGrid.cellSize = 90;
			debugGrid.gridSize = new Pt(30, 30);
			debugGrid.gridStroke = new Stroke(1,0xFF0000);
			debugGrid.scene = isoGameScene;
			debugGrid.showOrigin = true;
			debugGrid.zIndex = 0;
			debugGrid.position = new Pt(0, 0, 0);
			debugGrid.layerIndex = 1;
			gameEntity.addComponent(debugGrid, "IsoGrid");
		
			
			isoGridE = new MyIsoGridComponent();
			isoGridE.cellSize = 90;
			isoGridE.gridSize = new Pt(3, 3);
			isoGridE.gridStroke = new Stroke(1, 0);
			isoGridE.scene = isoGameScene;
			isoGridE.showOrigin = true;
			isoGridE.zIndex = 0;
			isoGridE.position = new Pt(0, 0, 0);
			isoGridE.positionOffset = new Pt(-135, -135, 0);
			isoGridE.layerIndex = 2;
			gameEntity.addComponent(isoGridE, "IsoGridE");
			
			
			isoGridB = new MyIsoGridComponent();
			isoGridB.cellSize = 90;
			isoGridB.gridSize = new Pt(3, 3);
			isoGridB.gridStroke = new Stroke(1, 0);
			isoGridB.scene = isoGameScene;
			isoGridB.showOrigin = true;
			isoGridB.zIndex = 0;
			isoGridB.position = new Pt(0, isoGridE.position.y - isoGridE.gridSize.y* 90 - 180, 0);
			isoGridB.positionOffset = new Pt(-135, -135, 0);
			isoGridB.layerIndex = 2;
			gameEntity.addComponent(isoGridB, "IsoGridB");
			
			isoGridD = new MyIsoGridComponent();
			isoGridD.cellSize = 90;
			isoGridD.gridSize = new Pt(3, 3);
			isoGridD.gridStroke = new Stroke(1, 0);
			isoGridD.scene = isoGameScene;
			isoGridD.showOrigin = true;
			isoGridD.zIndex = 0;
			isoGridD.position = new Pt(0, isoGridE.position.y + isoGridE.gridSize.y* 90 + 180, 0);
			isoGridD.positionOffset = new Pt(-135, -135, 0);
			isoGridD.layerIndex = 2;
			gameEntity.addComponent(isoGridD, "IsoGridD");
			
			isoGridA = new MyIsoGridComponent();
			isoGridA.cellSize = 90;
			isoGridA.gridSize = new Pt(3, 3);
			isoGridA.gridStroke = new Stroke(1, 0);
			isoGridA.scene = isoGameScene;
			isoGridA.showOrigin = true;
			isoGridA.zIndex = 0;
			isoGridA.position = new Pt(isoGridE.position.x - isoGridE.gridSize.x* 90 - 180, 0, 0);
			isoGridA.positionOffset = new Pt(-135, -135, 0);
			isoGridA.layerIndex = 2;
			gameEntity.addComponent(isoGridA, "IsoGridA");
			
			isoGridC = new MyIsoGridComponent();
			isoGridC.cellSize = 90;
			isoGridC.gridSize = new Pt(3, 3);
			isoGridC.gridStroke = new Stroke(1, 0);
			isoGridC.scene = isoGameScene;
			isoGridC.showOrigin = true;
			isoGridC.zIndex = 0;
			isoGridC.position = new Pt(isoGridE.position.x + isoGridE.gridSize.x* 90 + 180, 0, 0);
			isoGridC.positionOffset = new Pt(-135, -135, 0);
			isoGridC.layerIndex = 2;
			gameEntity.addComponent(isoGridC, "IsoGridC");
		}
		
		private function addListener():void
		{
			battleScene.swfBtn.addEventListener(MouseEvent.CLICK, onSwfBtn);
			battleScene.spriteSheetBtn.addEventListener(MouseEvent.CLICK, onSpriteSheetBtn);
			battleScene.drapBtn.addEventListener(MouseEvent.CLICK, onDrapBtn);
			battleScene.goMainMenu.addEventListener(MouseEvent.CLICK, onGoMainMenu);
		}
		
		private function onSwfBtn(evt:MouseEvent):void
		{
			addAsset();
		}
		
		private function onSpriteSheetBtn(evt:MouseEvent):void
		{
			AddSprites.addSpriteSheet();
		}
		
		private function onDrapBtn(evt:MouseEvent):void
		{
			// TODO Auto-generated method stub
			mousepanning = new MousePanningSceneComponent();
			mousepanning.scene = isoGameScene;
			mousepanning.sceneView = defaultView;
			mousepanning.leftTopOffset = new Point(200,200);
			mousepanning.rightBottomOffset = new Point(200,200);
			gameEntity.addComponent(mousepanning,"MousePanningComponent");
		}
		
		private function onGoMainMenu(evt:MouseEvent):void
		{
			ScreenManager.instance.goto(GlobalDict.MAIN_MENU);
		}
		
		private function addAsset():void
		{
			// TODO Auto Generated method stub
			for(var count:int = 0 ; count < 2 ; count++){
				createAsset(count);
			}
			//box.debug
		}
		
		private function createAsset(id:int):void{
			var boxEntity:IEntity = allocateEntity();
			boxEntity.initialize("Box"+id);
			var spatial:MyIsoSpatialComponent = new MyIsoSpatialComponent();
			spatial.position = new Pt(10*id,10*id);
			boxEntity.addComponent(spatial,"Spatial"+id);
			
			var sprite:MyIsoSpriteComponent = new MyIsoSpriteComponent(false);
			sprite.sprite = worker;
			sprite.optimize = false;
			sprite.scene = isoGameScene;
			sprite.spatialComponentName = "Spatial"+id;
			boxEntity.addComponent(sprite,"Sprite"+id);
		}
	}
}