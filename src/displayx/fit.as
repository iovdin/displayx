package displayx {
	
public function fit(iw:Number,ih:Number,ow:Number,oh:Number):Object{
	var ret:Object = {width:0,height:0};
	if(iw == 0 || ih == 0 || ow == 0 || oh == 0) return ret;
	//trace("fit",iw,ih,ow,oh);
	
	//ratio of inner , inner is taller than outer
	//so limit by height of outer
	if(ih/iw > oh/ow){
		ret.height = Math.min(ih,oh);
		ret.width = iw * ret.height / ih;
	}else{
		ret.width = Math.min(iw,ow);
		ret.height = ih * ret.width / iw;
	}
	//trace("return",ret.width,ret.height);
	return ret;
}

}

