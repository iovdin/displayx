package displayx {
    import flash.display.DisplayObject;
    import flash.geom.Point;

    public function align(first : DisplayObject, firstParams : Object, second : DisplayObject = null, secondParams : Object = null, target : DisplayObject = null) : Point{
        var pt : Point = Aligner.calculate(first, firstParams, second, secondParams, "align", target);
        if(target == null)
            target = first;
        target.x = pt.x;
        target.y = pt.y;
        return pt;
    }
}
