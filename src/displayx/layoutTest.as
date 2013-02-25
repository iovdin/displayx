package displayx {
    import flash.display.DisplayObject;
    import flash.geom.Point;

    public function layoutTest(first : DisplayObject, firstParams : Object, second : DisplayObject = null, secondParams : Object = null, target : DisplayObject = null) : Point{
        return Aligner.calculate(first, firstParams, second, secondParams, "layout", target);
    }
}
