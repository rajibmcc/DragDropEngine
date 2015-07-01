package
{
	import flash.display.Sprite;
	
	public class Box extends Sprite
	{
		private var _color:uint;
		private var _width:Number;
		private var _height:Number;
		public function Box(width:Number, height:Number, color:uint = 0xCCCCCC)
		{
			super();
			_width = width;
			_height = height;
			_color = color;
			
			draw();
		}
		
		private function draw():void
		{
			graphics.clear();
			graphics.beginFill(_color);
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
		}
	}
}