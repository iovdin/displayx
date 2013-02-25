package displayx {

import flash.text.TextField;
import flash.text.TextFormat;
	
	
public function text(options:Object = null,tf:TextField = null):TextField{
	var textFormatProps:Array = ["align", "blockIndent", "bold" , "bullet", "color", "font", "indent", "italic", "kerning", "leading", "leftMargin", "letterSpacing", "rightMargin", "size", "underline", "url", "target"];
	var textFieldProps:Array = ["alwaysShowSelection","antiAliasType", "autoSize", "background", "backgroundColor", "border", "borderColor", "bottomScrollV", "caretIndex", "condenseWhite", "displayAsPassword", "embedFonts", "gridFitType", "htmlText", "maxChars", "maxScrollH",  "mouseWheelEnabled", "multiline", "restrict", "scrollH", "scrollV", "selectable", "sharpness", "text", "textColor", "thickness", "type", "useRichTextClipboard", "wordWrap" ];
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
		if(textFormatProps.indexOf(key) >= 0)
			tfmtOptions[key] = options[key];
		else if(textFieldProps.indexOf(key) >= 0)
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

