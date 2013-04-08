package displayx{
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Sprite;
    import flash.display.Stage;

    import flash.geom.Point;
    import flash.geom.ColorTransform;
    import flash.geom.Rectangle;

    public class Aligner{
        public static const BOUNDS_BITMAP : String = "boundsBitmap";
        public static const BOUNDS_STANDARD : String = "boundsStandard";

        public static const VCENTER : String = "vcenter";
        public static const TOP     : String = "top";
        public static const BOTTOM  : String = "bottom";

        public static const HCENTER : String = "hcenter";
        public static const LEFT    : String = "left";
        public static const RIGHT   : String = "right";


        public static function getBitmapBounds(target : DisplayObject, parent : DisplayObjectContainer = null) : Rectangle{
            var rect : Rectangle = new Rectangle();
            if(target == null)
                return rect;

            if(parent == null){
                if(target.stage == null){
                    return rect;
                }else{
                    parent = target.stage;
                }
            }

            rect = target.getBounds(parent);

            if(rect.width == 0 || rect.height == 0){
                return rect;
            }

            var bmd : BitmapData = new BitmapData(rect.width, rect.height, true, 0x0);
            //bmd.draw(target, null, new ColorTransform());
            bmd.draw(target);
            var bmdRect : Rectangle = bmd.getColorBoundsRect(0xFF000000, 0x00000000, false);
            bmd.dispose();
            bmdRect.x += rect.x;
            bmdRect.y += rect.y;

            return bmdRect;
        }

        public static function getOffset(bounds : Rectangle, params : Object) : Point{
            var pt:Point = new Point();
            if(params == null || bounds == null) return pt;

            if(params.hasOwnProperty(HCENTER)) pt.x = bounds.width * 0.5 + params.hcenter + bounds.x;
            else if(params.hasOwnProperty(LEFT)) pt.x = params.left + bounds.x;
            else if(params.hasOwnProperty(RIGHT)) pt.x = bounds.width - params.right + bounds.x;

            if(params.hasOwnProperty(VCENTER)) pt.y = bounds.height * 0.5 + params.vcenter + bounds.y;
            else if(params.hasOwnProperty(TOP)) pt.y = params.top + bounds.y;
            else if(params.hasOwnProperty(BOTTOM)) pt.y = bounds.height - params.bottom + bounds.y;

            return pt;
        }

        public static function calculate(inner : DisplayObject, innerParams : Object, outer : DisplayObject = null, outerParams : Object = null, paramsType : String = "layout", target : DisplayObject = null) : Point{
            //trace("calculate")
            if(target == null)
                target = inner;

            if(innerParams == null){
                throw(new Error("align: innerParams is not specified"))
            };
            // align(mc,{hcenter:0,bottom:10}) means
            // align(mc,{hcenter:0,bottom:0},stage,{hcenter:0,bottom:10});
            if(outerParams == null) {
                var tmp : Object = innerParams;
                outerParams = {};
                innerParams = {};
                for (var key:String in tmp){
                    innerParams[key] = 0;
                    outerParams[key] = tmp[key];

                    if(paramsType == "align"){
                        var invkey : String = inverseParam(key);
                        //trace("key: ", key, "invkey", invkey);
                        if(invkey != key) {
                            outerParams[invkey] = -tmp[key];
                            delete outerParams[key];
                        }
                    }
                }
            }
            if(inner == null){
                throw(new Error("align: inner is null"))
            }

            if(outer == null){ 
                if(inner.hasOwnProperty("stage") && inner.stage != null){
                    //make stage as target except out of bounds objects
                    //just stageWidth and stageHeight rect
                    var st:Sprite = new Sprite();
                    st.graphics.clear();
                    st.graphics.beginFill(0x0);
                    st.graphics.drawRect(0, 0, inner.stage.stageWidth, inner.stage.stageHeight);
                    st.graphics.endFill();
                    outer = st;
                }else{
                    throw(new Error("displayx: can not align/layout on stage while not being added to stage"));
                }
            }

            if(outer && outer is Stage){
                //make stage as target except out of bounds objects
                //just stageWidth and stageHeight rect
                var st1:Sprite = new Sprite();
                with(st1.graphics){
                    clear();
                    beginFill(0x0);
                    drawRect(0,0,outer.stageWidth, outer.stageHeight);
                    endFill();			
                }
                outer = st1;
            }

            //var p1:Point = getOffset(getBitmapBounds(inner, inner.parent), innerParams);
            //var p2:Point = getOffset(getBitmapBounds(outer, inner.parent), outerParams);
            var p1:Point = getOffset(inner.getBounds(inner.parent), innerParams);
            var p2:Point = getOffset(outer.getBounds(inner.parent), outerParams);

            if(target != inner){
                p1 = target.parent.globalToLocal(inner.parent.localToGlobal(p1));
                p2 = target.parent.globalToLocal(inner.parent.localToGlobal(p2));
            }

            return new Point(target.x + p2.x - p1.x, target.y + p2.y - p1.y);
        }

        private static function inverseParam(param : String) : String{
            if(param == LEFT)
                return RIGHT;
            if(param == RIGHT)
                return LEFT;
            if(param == BOTTOM)
                return TOP;
            if(param == TOP)
                return BOTTOM;

            return param;
        }
    }
}
