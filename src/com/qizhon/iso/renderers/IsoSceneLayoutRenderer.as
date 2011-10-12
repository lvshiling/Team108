package com.qizhon.iso.renderers
{
    import as3isolib.bounds.*;
    import as3isolib.core.*;
    import as3isolib.display.renderers.ISceneLayoutRenderer;
    import as3isolib.display.scene.*;
    
    import flash.utils.*;

    public class IsoSceneLayoutRenderer extends Object implements ISceneLayoutRenderer, IIsoCustomRenderer
    {
        private var depth:uint;
        private var visited:Dictionary;
        private var scene:IIsoScene;
        private var dependency:Dictionary;
        private var collisionDetectionFunc:Function = null;

        public function IsoSceneLayoutRenderer()
        {
            this.visited = new Dictionary();
            this.collisionDetection = this.defaultCollisionFunction;
            return;
        }// end function

        public function renderScene(param1:IIsoScene) : void
        {
            var _loc_5:IsoDisplayObject = null;
            var _loc_6:IsoDisplayObject = null;
            var _loc_7:Array = null;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:IsoDisplayObject = null;
            var _loc_12:Number = NaN;
            this.scene = param1;
            var _loc_2:* = getTimer();
            this.dependency = new Dictionary();
            var _loc_3:* = param1.displayListChildren;
            var _loc_4:* = _loc_3.length;
            for each (_loc_5 in _loc_3)
            {
                
                _loc_7 = [];
                _loc_8 = _loc_5.x + _loc_5.width;
                _loc_9 = _loc_5.y + _loc_5.length;
                _loc_10 = _loc_5.z + _loc_5.height;
                for each (_loc_11 in _loc_3)
                {
                    
                    _loc_12 = this.collisionDetectionFunc.call(null, _loc_5, _loc_11);
                    if (_loc_12 == 0)
                    {
                        _loc_7.push(_loc_11);
                    }
                }
                this.dependency[_loc_5] = _loc_7;
            }
            this.depth = 0;
            for each (_loc_6 in _loc_3)
            {
                
                if (this.visited[_loc_6] !== true)
                {
                    this.place(_loc_6);
                }
            }
            this.visited = new Dictionary();
            return;
        }// end function

        public function destroy() : void
        {
            this.scene = null;
            this.dependency = null;
            this.visited = null;
            return;
        }// end function

        private function place(param1:IsoDisplayObject) : void
        {
            var _loc_2:IsoDisplayObject = null;
            this.visited[param1] = true;
            for each (_loc_2 in this.dependency[param1])
            {
                
                if (this.visited[_loc_2] !== true)
                {
                    this.place(_loc_2);
                }
            }
            if (this.depth != param1.depth)
            {
                this.scene.setChildIndex(param1, this.depth);
            }
            var _loc_3:IsoSceneLayoutRenderer = this;
            var _loc_4:* = this.depth + 1;
            _loc_3.depth = _loc_4;
            return;
        }// end function

        protected function defaultCollisionFunction(param1:Object, param2:Object) : int
        {
            var _loc_8:int = 0;
            var _loc_9:int = 0;
            var _loc_3:* = param1 as IIsoDisplayObject;
            var _loc_4:* = param2 as IIsoDisplayObject;
            if (_loc_3 != null)
            {
            }
            if (_loc_4 == null)
            {
                return 1;
            }
            if (_loc_3 == _loc_4)
            {
                return 1;
            }
            var _loc_5:* = _loc_4.distance;
            if (isNaN(_loc_3.distance))
            {
            }
            if (!isNaN(_loc_4.distance))
            {
                if (_loc_3.distance <= 0)
                {
                }
                if (_loc_4.distance <= 0)
                {
                }
                if (_loc_3.distance != -1)
                {
                }
            }
            if (_loc_3.distance == -1)
            {
                _loc_8 = _loc_3.distance;
                _loc_9 = _loc_4.distance;
                return _loc_8 > _loc_9 ? (0) : (1);
            }
            var _loc_6:* = _loc_3.isoBounds;
            var _loc_7:* = _loc_4.isoBounds;
            if (_loc_6.right <= _loc_7.left)
            {
                return 1;
            }
            if (_loc_6.front <= _loc_7.back)
            {
                return 1;
            }
            if (_loc_6.top <= _loc_7.bottom)
            {
                return 1;
            }
            if (_loc_6.left >= _loc_7.right)
            {
                return 0;
            }
            if (_loc_6.back >= _loc_7.front)
            {
                return 0;
            }
            if (_loc_6.bottom >= _loc_7.top)
            {
                return 0;
            }
            return 0;
        }// end function

        public function get collisionDetection() : Function
        {
            return this.collisionDetectionFunc;
        }// end function

        public function set collisionDetection(param1:Function) : void
        {
            this.collisionDetectionFunc = param1;
            return;
        }// end function

    }
}
