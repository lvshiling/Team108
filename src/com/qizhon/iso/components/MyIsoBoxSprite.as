package com.qizhon.iso.components
{
    import as3isolib.display.primitive.*;
    import flash.display.*;

    public class MyIsoBoxSprite extends IsoBox
    {
        public var geometryVisible:Boolean = false;

        public function MyIsoBoxSprite(param1:Object = null)
        {
            super(param1);
            return;
        }// end function

        override protected function drawGeometry() : void
        {
            if (this.geometryVisible)
            {
                super.drawGeometry();
            }
            else
            {
                mainContainer.graphics.clear();
            }
            return;
        }// end function

        override protected function createChildren() : void
        {
            mainContainer = new Sprite();
            super.createChildren();
            return;
        }// end function

    }
}
