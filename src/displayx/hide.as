package displayx {

	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	
	public function hide(dp:Object,time:Number = 0.1):void{
		if(!dp) return;
		TweenLite.killTweensOf(dp);
		if(dp.visible == false) return;
		TweenLite.to(dp,time,{alpha:0.0,onComplete:function():void{
			dp.visible = false;
		}})
	}

}

