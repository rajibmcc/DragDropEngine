package
{
	import com.mcc.interactive.DragDrop;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class DragDropEngine extends Sprite
	{
		[Embed(source="../assets/chips.png")]
		private var chips:Class;
		
		public function DragDropEngine()
		{
			//var bdata:BitmapData = new chips();
			//var img:Bitmap = new Bitmap(bdata);
			var img:Bitmap = new chips();
			img.scaleX = img.scaleY = .02;
			
			
			
			/*var spImg:Sprite = new Sprite();
			spImg.addChild(img);
			addChild(spImg);*/
			
			var dragDrop:DragDrop = new DragDrop(stage);
			//addChild(dragDrop);
			
			
			for(var i:int = 0; i< 5; i++){
				var box:Box = new Box(60, 60, Math.random()*0xFFCCFF);
				box.x = 20 + i*80;
				addChild(box);
				
				dragDrop.registerDragable(box);
			}
			
			for(i = 0; i<5; i++){
				box = new Box(70, 70, Math.random()*0xFFCFFF);
				box.x = 20 + i*90;
				box.y = 240;
				addChild(box);
				
				dragDrop.registerDropTargets(box);
				dragDrop.registerDropTargets(box);
			}
			
			dragDrop.dragEnabled = true;
		}
		
	}
}