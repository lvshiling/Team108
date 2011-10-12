package
{
	import com.pblabs.screens.ScreenManager;
	import com.qizhon.i.Imdr;
	
	import flash.events.MouseEvent;
	
	public class MainMenuMdr implements Imdr
	{
		private var view:MainMenu;
		
		public function MainMenuMdr(mainMenu:MainMenu)
		{
			view = mainMenu;
			addListener();
		}
		
		public function initialize():void
		{
		}
		
		public function cleanUp():void
		{
		}
		
		private function addListener():void
		{
			view.pve.addEventListener(MouseEvent.CLICK, onPveHandler);
			view.setGroupGrid.addEventListener(MouseEvent.CLICK, onSetGroupGrid);
		}
		
		private function onPveHandler(evt:MouseEvent):void
		{
			ScreenManager.instance.goto(GlobalDict.BATTLE_SCENE);
		}
		
		private function onSetGroupGrid(evt:MouseEvent):void
		{
			ScreenManager.instance.goto(GlobalDict.FIGHT_GROUP);
		}
	}
}