package com.qizhon.iso.components
{
    import as3isolib.geom.*;
    import com.pblabs.rendering2D.*;

    public interface IIsoSpatialObject extends ISpatialObject2D
    {

        public function IIsoSpatialObject();

        function get position() : Pt;

        function set position(param1:Pt) : void;

        function get positionOffset() : Pt;

        function set positionOffset(param1:Pt) : void;

        function get rotation() : Number;

        function set rotation(param1:Number) : void;

        function get isometricVolume() : Pt;

        function set isometricVolume(param1:Pt) : void;

        function get spatialManager() : ISpatialManager2D;

        function set spatialManager(param1:ISpatialManager2D) : void;

    }
}
