package com.qizhon.iso.components
{
    import as3isolib.core.*;
    import as3isolib.geom.*;
    import com.pblabs.rendering2D.*;
    import flash.display.*;
    import flash.geom.*;

    public interface IIsoComponent
    {

        public function IIsoComponent();

        function get isoComponent() : IIsoDisplayObject;

        function get scene() : IScene2D;

        function set scene(param1:IScene2D) : void;

        function get displayObject() : DisplayObject;

        function set displayObject(param1:DisplayObject) : void;

        function get isometricVolume() : Pt;

        function set isometricVolume(param1:Pt) : void;

        function get position() : Point;

        function set position(param1:Point) : void;

        function get positionOffset() : Point;

        function set positionOffset(param1:Point) : void;

        function get x() : Number;

        function set x(param1:Number) : void;

        function get y() : Number;

        function set y(param1:Number) : void;

        function get z() : Number;

        function set z(param1:Number) : void;

        function get debug() : Boolean;

        function set debug(param1:Boolean) : void;

        function get zIndex() : int;

        function set zIndex(param1:int) : void;

        function get spatialComponentName() : String;

        function set spatialComponentName(param1:String) : void;

    }
}
