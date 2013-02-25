package displayx {

	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	
	public function show(dp:Object,time:Number = 0.1):void{
		if(!dp) return;

		TweenLite.killTweensOf(dp);
		if(dp.visible == false){
			dp.visible = true;	
		}
		dp.alpha = 0.0;
		TweenLite.to(dp,time,{alpha:1.0})
	}

}

