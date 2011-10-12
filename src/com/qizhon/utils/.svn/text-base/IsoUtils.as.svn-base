package com.qizhon.utils
{
    import as3isolib.geom.*;
    import com.pblabs.rendering2D.*;
    import flash.display.*;
    import flash.geom.*;

    final public class IsoUtils extends Object
    {

        public function IsoUtils()
        {
            return;
        }// end function

        public static function mouseToIso(param1:int, param2:int, param3:IScene2D) : Pt
        {
            var _loc_4:* = new Point(param1, param2);
            var _loc_5:* = param3.transformScreenToScene(_loc_4.clone());
            var _loc_6:* = param3.transformScreenToWorld(_loc_5.clone()) as Pt;
            return _loc_6;
        }// end function

        public static function isoToStageMouse(param1:Pt, param2:IScene2D) : Point
        {
            if (!param2)
            {
                return new Point();
            }
            var _loc_3:* = param2.transformWorldToScreen(param1);
            return param2.transformSceneToScreen(_loc_3);
        }// end function

        public static function stopMovieClips(param1:MovieClip) : void
        {
            var _loc_3:MovieClip = null;
            if (param1)
            {
                param1.gotoAndStop(1);
            }
            var _loc_2:int = 0;
            while (_loc_2 < param1.numChildren)
            {
                
                _loc_3 = param1.getChildAt(_loc_2) as MovieClip;
                if (!_loc_3)
                {
                }
                else
                {
                    if (_loc_3.totalFrames >= 1)
                    {
                        _loc_3.gotoAndStop(1);
                    }
                    else
                    {
                        _loc_3.gotoAndStop(_loc_3.totalFrames);
                    }
                    stopMovieClips(_loc_3);
                }
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

    }
}
