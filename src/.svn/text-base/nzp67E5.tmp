package
{
	import com.pblabs.engine.PBE;
	import com.pblabs.screens.ScreenManager;
	
	import data.CardPosVo;
	
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	
	import scene.BattleScene;
	
	import ui.Fightgroup;
	import ui.GridCardGroup;

	public class MainMdr
	{
		private var view:Main;
		public static var fake:UIComponent = new UIComponent;
		
		public function MainMdr(mainView:Main)
		{
			view = mainView;
			fake.width = view.width;
			fake.height = view.height;
			view.addElement(fake);
			PBE.startup(fake);
			initDataSet();
			initScreenMgr();
		}
		
		private function start():void
		{
			// TODO Auto Generated method stub
			fake.width = FlexGlobals.topLevelApplication.width;
			fake.height = FlexGlobals.topLevelApplication.height;
			//FlexGlobals.topLevelApplication.addElement(wrapper);
		}
		
		private function initScreenMgr():void
		{
			ScreenManager.instance.registerScreen(GlobalDict.MAIN_MENU, new MainMenu);
			ScreenManager.instance.registerScreen(GlobalDict.BATTLE_SCENE, new BattleScene);
			ScreenManager.instance.registerScreen(GlobalDict.FIGHT_GROUP, new GridCardGroup);
			ScreenManager.instance.goto(GlobalDict.MAIN_MENU);
		}
		private function initDataSet():void
		{
			if(GlobalDict.cardPosGrids)
			{
				var pos:CardPosVo = new CardPosVo;
				pos.unitId = 1;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '1';
				GlobalDict.cardPosGrids.addItem(pos);
				
				pos = new CardPosVo;
				pos.unitId = 2;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '2';
				GlobalDict.cardPosGrids.addItem(pos);
				
				pos = new CardPosVo;
				pos.unitId = 3;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '3';
				GlobalDict.cardPosGrids.addItem(pos);

				pos = new CardPosVo;
				pos.unitId = 4;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '4';
				GlobalDict.cardPosGrids.addItem(pos);
			
				pos = new CardPosVo;
				pos.unitId = 5;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '5';
				GlobalDict.cardPosGrids.addItem(pos);
			
				pos = new CardPosVo;
				pos.unitId = 6;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '6';
				GlobalDict.cardPosGrids.addItem(pos);

				pos = new CardPosVo;
				pos.unitId = 7;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '7';
				GlobalDict.cardPosGrids.addItem(pos);

				pos = new CardPosVo;
				pos.unitId = 8;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '8';
				GlobalDict.cardPosGrids.addItem(pos);

				pos = new CardPosVo;
				pos.unitId = 9;
				pos.resUrl = 'assets/bg.jpg';
				pos.label = '9';
				GlobalDict.cardPosGrids.addItem(pos);

			}
		}
	}
}