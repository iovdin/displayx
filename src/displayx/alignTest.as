package displayx {
    import flash.display.DisplayObject;
    import flash.geom.Point;

    public function alignTest(first : DisplayObject, firstParams : Object, second : DisplayObject = null, secondParams : Object = null, target : DisplayObject = null) : Point{
        return Aligner.calculate(first, firstParams, second, secondParams, "align", target);
    }
}
