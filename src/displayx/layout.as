package displayx {
    import flash.display.DisplayObject;
    import flash.geom.Point;
    public function layout(first : DisplayObject, firstParams : Object, second : DisplayObject = null, secondParams : Object = null, target : DisplayObject = null) : void{
        var pt : Point = Aligner.calculate(first, firstParams, second, secondParams, "layout", target);
        if(target == null)
            target = first;
        target.x = pt.x;
        target.y = pt.y;
    }
}
