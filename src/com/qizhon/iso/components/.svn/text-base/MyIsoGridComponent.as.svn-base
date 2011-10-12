package com.qizhon.iso.components
{
    import as3isolib.display.scene.*;
    import as3isolib.geom.*;
    import as3isolib.graphics.*;
    
    import com.pblabs.engine.entity.*;
    
    import flash.utils.*;

    public class MyIsoGridComponent extends MyIsoBaseComponent
    {
        public static const COMPONENT_NAME:String = getQualifiedClassName(MyIsoGridComponent).replace("::", ".");

        public function MyIsoGridComponent(param1:Boolean = false) : void
        {
            super(param1);
            _isoObject = new IsoGrid();
            _isoObject.isAnimated = false;
            return;
        }// end function

        public function get stroke() : IStroke
        {
            return IsoGrid(_isoObject).stroke;
        }// end function

        public function set stroke(param1:IStroke) : void
        {
            IsoGrid(_isoObject).stroke = param1;
            return;
        }// end function

        public function get showOrigin() : Boolean
        {
            return IsoGrid(_isoObject).showOrigin;
        }// end function

        public function set showOrigin(param1:Boolean) : void
        {
            IsoGrid(_isoObject).showOrigin = param1;
            return;
        }// end function

        public function get cellSize() : Number
        {
            return IsoGrid(_isoObject).cellSize;
        }// end function

        public function set cellSize(param1:Number) : void
        {
            IsoGrid(_isoObject).cellSize = param1;
            return;
        }// end function

        public function get gridSize() : Pt
        {
            return new Pt(IsoGrid(_isoObject).gridSize[0], IsoGrid(_isoObject).gridSize[1], IsoGrid(_isoObject).gridSize[2]);
        }// end function

        public function set gridSize(param1:Pt) : void
        {
            IsoGrid(_isoObject).setGridSize(param1.x, param1.y, param1.z);
            return;
        }// end function

        public function get gridStroke() : IStroke
        {
            return IsoGrid(_isoObject).stroke;
        }// end function

        public function set gridStroke(param1:IStroke) : void
        {
            IsoGrid(_isoObject).stroke = param1;
            return;
        }// end function

        public static function getFrom(param1:IEntity) : MyIsoGridComponent
        {
            return param1.lookupComponentByType(MyIsoGridComponent) as MyIsoGridComponent;
        }// end function

    }
}
