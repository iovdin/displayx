package  {
    
import asunit.asserts.*;
import asunit.framework.IAsync;
import flash.display.Sprite;
import displayx.*;
import flash.utils.*;
import flash.text.*;

public class AlignTest {

	[Inject]
	public var async:IAsync;

	[Inject]
	public var context:Sprite;

	private var testTime:Number = 2000;
	
	private var outer:Sprite;
	private var inner:Sprite;
	private var inner2:Sprite;
	private var tf:TextField;

	[Before]
	public function setUp():void {
		outer = new Sprite();
		inner = new Sprite();
        inner2 = new Sprite();
		context.addChild(outer);
		context.addChild(inner);
		with(outer.graphics){
			clear();
			beginFill(0xAAAAAA,0.9)
			drawRect(0,0,300,200);
			endFill();
		}
		with(inner.graphics){
			clear();
			beginFill(0x0000AA,0.9)
			drawRect(0,0,100,100);
			endFill();
		}
		with(inner2.graphics){
			clear();
			beginFill(0x00AAAA,0.9)
			drawRect(0,0,50,60);
			endFill();
		}
		tf = text({autoSize:"left",font:"Verdana",size:14,background:true,backgroundColor:0xFFFFFF,selectable:false});
		context.addChild(tf);
	}

	[After]
	public function tearDown():void {
		context.removeChild(outer);
		context.removeChild(inner);
        if(inner2.parent)
            inner2.parent.removeChild(inner2);
		context.removeChild(tf);
		outer = null;
		inner = null;
        inner2 = null;
		tf = null;
	}

	[Test]
	public function centeredStage():void {
		tf.text = "Are boxes at the center?"
		layout(outer,{hcenter:0,vcenter:0});
		layout(inner,{hcenter:0,vcenter:0}, outer);
		layout(tf,{top:20,hcenter:0});
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	
	[Test]
	public function centerRotatedStage():void {
		tf.text = "Are rotated boxes at the center?"
		outer.rotation = 30;
		inner.rotation = -72;
		layout(outer,{hcenter:0,vcenter:0});
		layout(inner,{hcenter:0,vcenter:0},outer);
		layout(tf,{top:20,hcenter:0});
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}	
	
	[Test]
	public function topRight():void {
		tf.text = "{top:10,right:10}"
		layout(outer,{hcenter:0,vcenter:0});
		layout(inner,{top:10,right:10},outer);
		layout(tf,{top:20,hcenter:0});
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	[Test]
	public function bottomLeft():void {
		tf.text = "{bottom:10,left:10}"
		layout(outer,{hcenter:0,vcenter:0});
		layout(inner,{bottom:10,left:10},outer);
		layout(tf,{top:20,hcenter:0});
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}
	
	[Test]
	public function testLayoutTestValidReturn():void {
		tf.text = "layoutTest";
		var tw:Object = layoutTest(inner,{vcenter:0,hcenter:0},outer);
		assertTrue("returned layouto object is not null", tw != null);

		assertTrue("layouto return has x",tw.hasOwnProperty("x"));
		assertTrue("layouto return has y",tw.hasOwnProperty("y"));

		assertTrue("layouto return x is Number",tw.x is Number);
		assertTrue("layouto return y is Number",tw.y is Number);
		
		layout(tf,{top:20,hcenter:0});
	}
	
	[Test]
	public function layoutTestCenteredStage():void {
		tf.text = "layoutTest: Are boxes at the center?";
		var tw:Object;
		tw = layoutTest(outer ,{hcenter:0,vcenter:0},outer.stage);
		outer.x = tw.x;
		outer.y = tw.y;

		tw = layoutTest(inner,{hcenter:0,vcenter:0},outer);
		inner.x = tw.x;
		inner.y = tw.y;
		
		layout(inner,{hcenter:0,vcenter:0},outer);
		layout(tf,{top:20,hcenter:0});
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}	

	[Test]
	public function alignVerticalCenter():void {

		tf.text = "{vcenter:0,left:10}";

        layout(tf,{top:20,hcenter:0});

        layout(outer,{hcenter:0,vcenter:0});
        layout(inner,{vcenter:0, right:10}, outer);
        context.addChild(inner2);
        //align(inner2, {vcenter:0, right:10}, inner);
        layout(inner2, {vcenter:0, right: 0}, inner, {vcenter:0, left:-10});
		setTimeout(async.add(function(e:Object):void{
			assertTrue(tf.text,true);
		},testTime+1000),testTime);
	}

    [Test]
    public function combineAlignAndLayout():void {

        tf.text = "align {left:10}, layout {bottom : 0}";

        layout(tf,{top:20,hcenter:0});

        layout(outer,{hcenter:0,vcenter:0});
        layout(inner,{vcenter:0, right:10}, outer);
        context.addChild(inner2);
        align(inner2, {vcenter : 0, right:10}, inner);
        layout(inner2, {bottom:0}, inner);
        //layout(inner2, {vcenter:0, right: 0}, inner, {vcenter:0, left:-10});
        setTimeout(async.add(function(e:Object):void{
            assertTrue(tf.text,true);
        },testTime+1000),testTime);
    }

    [Test]
    public function targetTest():void {

        tf.text = "target test";

        layout(tf,{top:20,hcenter:0});

        inner.addChild(inner2);
        layout(outer,{hcenter:0,vcenter:0});
        layout(inner2,{vcenter:0, hcenter : 0}, outer, null, inner);

        setTimeout(async.add(function(e:Object):void{
            assertTrue(tf.text,true);
        },testTime+1000),testTime);
    }

}
}

