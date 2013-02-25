package displayx{
    import flash.display.Sprite;
    import flashx.textLayout.elements.SpanElement;
    import flashx.textLayout.elements.TextFlow;
    import flashx.textLayout.container.ContainerController;
    import flashx.textLayout.elements.ParagraphElement;


    public function textx(options : Object, container : Sprite = null) : Sprite{

        if(container != null){
            while(container.numChildren > 0){
                container.removeChildAt(0);
            }
        }else{
            container = new Sprite();
        }

        var props : Object = {
            fontColor : 0x0, 
            fontFamily : "Verdana", 
            fontSize : 12, 
            textAlpha : 1.0,
            text : "",
            backgroundColor : 0xFFFFFF,
            backgroundAlpha : 1.0,
            padding : 0,
            width : 300, 
            height : 100

        };

        for(var key : String in options){
            if(options[key])
                props[key] = options[key];
        }


        var textFlow : TextFlow = new TextFlow();
        var p:ParagraphElement = new ParagraphElement();
        var span : SpanElement = new SpanElement();

        span.color = props.fontColor;
        span.fontFamily = props.fontFamily;
        span.fontSize = props.fontSize;
        span.textAlpha = props.textAlpha;
        span.text = props.text;
        //span.lineHeight = 20;

        span.backgroundColor = props.backgroundColor;
        span.backgroundAlpha = props.backgroundAlpha;

        p.addChild(span);

        //with(p){
            //paddingBottom = paddingTop = paddingLeft = paddingRight = props.padding;
        //}

        textFlow.addChild(p);

        var controller:ContainerController = new ContainerController(container, props.width, props.height);

        textFlow.flowComposer.addController(controller);
        textFlow.flowComposer.updateAllControllers();

        /*with(container.graphics){
            clear();
            beginFill(props.backgroundColor, props.backgroundAlpha);
            drawRect(0, 0, props.width, props.height);
            endFill();
        }*/

        return container;
    }
}
