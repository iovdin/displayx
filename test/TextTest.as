package  {
    
import asunit.asserts.*;
import asunit.framework.IAsync;
import flash.display.Sprite;
import flash.text.TextField;
import flash.utils.*;
import displayx.*;
import flash.text.*;

public class TextTest {

	
	[Embed(source="../assets/myriad.otf", fontFamily="MyMyriad")] 
  private var myfont:Class;

	[Inject]
	public var async:IAsync;

	[Inject]
	public var context:Sprite;

	private var instance:Sprite;
	private var tf:TextField;
	private var testTime:Number = 1000;
	
	[Before]
	public function setUp():void {
		instance = new Sprite();
		tf = new TextField();
		tf.width = 200;
		tf.height = 100;
		context.addChild(instance);
		instance.addChild(tf);
		with(instance.graphics){
			clear();
			beginFill(0xFFFFFF,0.9);
			drawRect(0,0,300,200);
			endFill();
		}
		//trace("setUp")
	}

	[After]
	public function tearDown():void {
		context.removeChild(instance);
		instance.removeChild(tf);
		tf = null;
	  instance = null;
		//trace("tearDown")
	}
	

	[Test]
	public function textVisible():void {
		text(null,tf);
		tf.text = "text is visible?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	

	[Test]
	public function borderParamTest():void {
		text({border:true,borderColor:0x0000FF},tf);
		tf.text = "border visible? has border color?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	
	[Test]
	public function underlineParamTest():void {
		text({underline:true},tf);
		tf.text = "underline?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

	[Test]
	public function backgroundParamTest():void {
		text({background:true,backgroundColor:0xAAAAAA},tf);
		tf.text = "background?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

	[Test]
	public function multilineWordWrapParamTest():void {
		text({multiline:true,wordWrap:true},tf);
		tf.text = "is text multilined? bla bla bla bla bla bla bla bla bla bla";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}	
	
	/*
	var textFormatProps:Array = ["align", "blockIndent", "bold" , "bullet", "color", "font", "indent", "italic", "kerning", "leading", "leftMargin", "letterSpacing", "rightMargin", "size", "underline", "url", "target"];
	var textFieldProps:Array = ["alwaysShowSelection","antiAliasType", "autoSize", "background", "backgroundColor", "border", "borderColor", "bottomScrollV", "caretIndex", "condenseWhite", "displayAsPassword", "embedFonts", "gridFitType", "htmlText", "maxChars", "maxScrollH",  "mouseWheelEnabled", "multiline", "restrict", "scrollH", "scrollV", "selectable", "sharpness", "text", "textColor", "thickness", "type", "useRichTextClipboard", "wordWrap" ];
	*/

	[Test]
	public function embedFontParamTest():void {
		var fonts:Array = Font.enumerateFonts();
		trace("embeded font",fonts[0].fontName, fonts[0].fontStyle, fonts[0].fontType);
		Font.registerFont(myfont);
		text({embedFonts:true, font:"MyMyriad", border:true},tf);
		tf.text = "is that font Myriad?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

	[Test]
	public function autoSizeParamTest():void {
		text({autoSize:"left", border:true},tf);
		tf.text = "is box fit text size?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

	[Test]
	public function textColorParamTest():void {
		text({textColor:0x0000FF},tf);
		tf.text = "Is text blue?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}


	[Test]
	public function leftMarginParamTest():void {
		text({leftMargin:20,border:true},tf);
		tf.text = "left margin 20px?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

	[Test]
	public function rightMarginParamTest():void {
		text({rightMargin:20,border:true,wordWrap:true,multiline:true},tf);
		tf.text = "right margin 20px? bla bla bla bla bla bla bla";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}


	[Test]
	public function alignParamTest():void {
		text({align:"center",border:true},tf);
		tf.text = "aligned to center?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

	
	[Test]
	public function displayAsPasswordParamTest():void {
		text({displayAsPassword:true},tf);
		tf.text = "Display as password?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
			
	[Test]
	public function fontParamTest():void {
		text({font:"Courier"},tf);
		tf.text = "Font is Courier?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	
	[Test]
	public function sizeParamTest():void {
		text({size:18},tf);
		tf.text = "18 size?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	
	[Test]
	public function boldParamTest():void {
		text({bold:true},tf);
		tf.text = "bold?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

	[Test]
	public function italicParamTest():void {
		text({italic:true},tf);
		tf.text = "italic?";
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}	
	
	[Test]
	public function overrideParamTest():void {
		text({italic:true},tf);
		tf.text = "bold italic?";
		text({bold:true},tf)
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	
	private function timeout():void{
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},3000),2000);
		
	}
}
}

