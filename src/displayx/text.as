package displayx {

    import flash.text.TextField;
    import flash.text.TextFormat;


    public function text(options:Object = null,tf:TextField = null):TextField{
        var key:String;
        var curTextFormat:Object = {}
        if(!tf){
            tf = new TextField();
        }else{
            for(key in tf.defaultTextFormat){
                curTextFormat[key] = tf.defaultTextFormat[key];
            }
        }
        var tfmtOptions:Object = {};
        for(key in options){
            if(Props.textFormatProps.hasOwnProperty(key))
                tfmtOptions[key] = options[key];
            else if(Props.textFieldProps.hasOwnProperty(key))
                tf[key] = options[key];
        }

        var tfmt:TextFormat = new TextFormat();

        for(key in curTextFormat){
            tfmt[key] = curTextFormat[key];
        }
        for(key in tfmtOptions){
            tfmt[key] = tfmtOptions[key];
        }
        tf.defaultTextFormat = tfmt;
        tf.setTextFormat(tfmt);

        return tf;
    }
}
class Props {
        //public static var textFormatProps:Vector.<String> = new <String>["align", "blockIndent", "bold" , "bullet", "color", "font", "indent", "italic", "kerning", "leading", "leftMargin", "letterSpacing", "rightMargin", "size", "underline", "url", "target"];
        //public static var textFieldProps:Vector.<String> = new <String>["alwaysShowSelection","antiAliasType", "autoSize", "background", "backgroundColor", "border", "borderColor", "bottomScrollV", "caretIndex", "condenseWhite", "displayAsPassword", "embedFonts", "gridFitType", "htmlText", "maxChars", "maxScrollH",  "mouseWheelEnabled", "multiline", "restrict", "scrollH", "scrollV", "selectable", "sharpness", "text", "textColor", "thickness", "type", "useRichTextClipboard", "wordWrap" ];

        public static var textFormatProps:Object = {"align":true, "blockIndent":true, "bold" :true, "bullet":true, "color":true, "font":true, "indent":true, "italic":true, "kerning":true, "leading":true, "leftMargin":true, "letterSpacing":true, "rightMargin":true, "size":true, "underline":true, "url":true, "target":true };
        public static var textFieldProps:Object = { "alwaysShowSelection":true,"antiAliasType":true, "autoSize":true, "background":true, "backgroundColor":true, "border":true, "borderColor":true, "bottomScrollV":true, "caretIndex":true, "condenseWhite":true, "displayAsPassword":true, "embedFonts":true, "gridFitType":true, "htmlText":true, "maxChars":true, "maxScrollH":true,  "mouseWheelEnabled":true, "multiline":true, "restrict":true, "scrollH":true, "scrollV":true, "selectable":true, "sharpness":true, "text":true, "textColor":true, "thickness":true, "type":true, "useRichTextClipboard":true, "wordWrap":true };
}

