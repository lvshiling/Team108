package com.qizhon.controls
{
    import com.pblabs.engine.debug.*;
    import com.pblabs.engine.entity.*;
    import com.pblabs.rendering2D.*;
    import flash.events.*;

    public class InteractionComponent extends EntityComponent
    {
        public var rendererReference:PropertyReference;
        public var enabled:Boolean = true;
        public var mouseOver:Boolean = true;
        public var mouseDown:Boolean = true;
        public var mouseUp:Boolean = true;
        public var mouseMove:Boolean = true;
        protected var _spriteForPointChecks:DisplayObjectRenderer;

        public function InteractionComponent()
        {
            return;
        }// end function

        override protected function onAdd() : void
        {
            super.onAdd();
            this.addListeners();
            return;
        }// end function

        override protected function onRemove() : void
        {
            this.removeListeners();
            this._spriteForPointChecks = null;
            super.onRemove();
            return;
        }// end function

        override protected function onReset() : void
        {
            super.onReset();
            if (!this._spriteForPointChecks)
            {
                return;
            }
            if (this._spriteForPointChecks.owner != this.owner)
            {
                this.removeListeners();
                this._spriteForPointChecks = null;
                return;
            }
            if (this.rendererReference)
            {
                this.spriteForPointChecks = owner.getProperty(this.rendererReference) as DisplayObjectRenderer;
            }
            return;
        }// end function

        protected function addListeners() : void
        {
            if (this.spriteForPointChecks)
            {
                if (!this.spriteForPointChecks.displayObject)
                {
                    return;
                }
                this.spriteForPointChecks.displayObject.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
                this.spriteForPointChecks.displayObject.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
                this.spriteForPointChecks.displayObject.addEventListener(MouseEvent.MOUSE_UP, this.onMouseUp);
                this.spriteForPointChecks.displayObject.addEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMove);
            }
            return;
        }// end function

        protected function removeListeners() : void
        {
            if (this.spriteForPointChecks)
            {
                if (!this.spriteForPointChecks.displayObject)
                {
                    return;
                }
                this.spriteForPointChecks.displayObject.removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
                this.spriteForPointChecks.displayObject.removeEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
                this.spriteForPointChecks.displayObject.removeEventListener(MouseEvent.MOUSE_UP, this.onMouseUp);
                this.spriteForPointChecks.displayObject.removeEventListener(MouseEvent.MOUSE_MOVE, this.onMouseMove);
            }
            return;
        }// end function

        protected function onMouseOver(event:MouseEvent) : void
        {
            if (this.mouseOver)
            {
            }
            if (this.enabled)
            {
                Logger.print(this, "Moused Over the Renderer");
                owner.eventDispatcher.dispatchEvent(event);
            }
            return;
        }// end function

        protected function onMouseDown(event:MouseEvent) : void
        {
            if (this.mouseDown)
            {
            }
            if (this.enabled)
            {
                Logger.print(this, "Moused Down on the Renderer");
                owner.eventDispatcher.dispatchEvent(event);
            }
            return;
        }// end function

        protected function onMouseUp(event:MouseEvent) : void
        {
            if (this.mouseUp)
            {
            }
            if (this.enabled)
            {
                Logger.print(this, "Moused Up on the Renderer");
                owner.eventDispatcher.dispatchEvent(event);
            }
            return;
        }// end function

        protected function onMouseMove(event:MouseEvent) : void
        {
            if (this.mouseMove)
            {
            }
            if (this.enabled)
            {
                Logger.print(this, "Mouse Moving Over the Renderer");
                owner.eventDispatcher.dispatchEvent(event);
            }
            return;
        }// end function

        public function get spriteForPointChecks() : DisplayObjectRenderer
        {
            if (this.rendererReference)
            {
            }
            if (!this._spriteForPointChecks)
            {
                var _loc_1:* = owner.getProperty(this.rendererReference) as DisplayObjectRenderer;
                this._spriteForPointChecks = owner.getProperty(this.rendererReference) as DisplayObjectRenderer;
                return _loc_1;
            }
            return this._spriteForPointChecks;
        }// end function

        public function set spriteForPointChecks(param1:DisplayObjectRenderer) : void
        {
            if (this._spriteForPointChecks)
            {
                this.removeListeners();
            }
            this._spriteForPointChecks = param1;
            this.addListeners();
            return;
        }// end function

    }
}
