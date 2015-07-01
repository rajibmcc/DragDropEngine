package com.mcc.interactive
{
	import com.mcc.interactive.UtilsDisplay.AlignTo;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	public class DragDrop
	{
		//Storing stage and parent reference
		private var _stageRef:Stage;
		private var _currentDisplayParent:DisplayObjectContainer;
		
		//Storing display objects to array. for controlling mouse events
		private var _dragablesDisplays:Array;
		private var _dropTargetDisplays:Array;
		
		//Storing data 
		private var _dragableData:Dictionary;
		private var _dropTargetData:Dictionary;
		
		// Mouse offset
		private var _offsetX:Number;
		private var _offsetY:Number;
		
		// Activate or deactivate drag
		private var _dragEnabled:Boolean;
		
		//Collision check methods
		private var _collisionActive:Function;
		
		
		//Current References
		private var _currentDisplayDropTarget:DisplayObject;
		private var _currentDisplayDrag:DisplayObject;
		private var _currentDataDT:DropTarget;
		private var _currentDataDB:Dragable;
		
		public function DragDrop(stageRef:Stage)
		{
			_stageRef = stageRef;
			_dragablesDisplays = new Array();
			_dropTargetDisplays = new Array();
			_dragableData = new Dictionary();
			_dropTargetData = new Dictionary();			
			_collisionActive = collisionBox;
		}
		
		public function registerDragable(dragable:DisplayObject, catagory:String = 'cat', knockOut:Boolean = false):void{
			//addChild(dragable);
				trace('...... registering ..  [name: '+dragable.name+']'+'    [object: '+dragable+']');
				var dragableData:Dragable = new Dragable();
				dragableData.catagory = catagory;
				dragableData.originX = dragable.x;
				dragableData.originY = dragable.y;
				dragableData.knockOut = knockOut;
				
				_dragableData[dragable] = dragableData;
				_dragablesDisplays.push(dragable);
		}
		
		public function registerDropTargets(dropTarget:DisplayObject , catagory:String = 'cat', dropLimit:int = 1, lockCatagory:Boolean = true):void{
			//addChild(dropTarget);
			var dropTargetData:DropTarget = new DropTarget();
			dropTargetData.catagory = catagory;
			dropTargetData.dropLimit = dropLimit;
			dropTargetData.lockCatagory = lockCatagory;

			_dropTargetData[dropTarget] = dropTargetData;
			_dropTargetDisplays.push(dropTarget);
		}
		
		public function set dragEnabled(value:Boolean):void{
			_dragEnabled = value;
			var dragableItem:DisplayObject;

			var i:int;
			if(value){			
				for(i = 0; i<_dragablesDisplays.length; i++){
					dragableItem = _dragablesDisplays[i] as DisplayObject;
					dragableItem.addEventListener(MouseEvent.MOUSE_DOWN, attachWithMouse);
				}
			}
			else{
				for(i = 0; i<_dragablesDisplays.length; i++){
					dragableItem = _dragablesDisplays[i] as DisplayObject;
					dragableItem.removeEventListener(MouseEvent.MOUSE_DOWN, attachWithMouse);
				}
			}
		}
		
		private function attachWithMouse(event:Event):void
		{
			_currentDisplayDrag = event.currentTarget as DisplayObject;
			_currentDisplayParent = _currentDisplayDrag.parent;
			_currentDisplayParent.addChild(_currentDisplayDrag);
			_offsetX = _currentDisplayParent.mouseX - _currentDisplayDrag.x;
			_offsetY = _currentDisplayParent.mouseY - _currentDisplayDrag.y;
			
			_stageRef.addEventListener(MouseEvent.MOUSE_MOVE, moveWithMouse);
			_stageRef.addEventListener(MouseEvent.MOUSE_UP, dragDone);
		}
		
		private function dragDone(event:MouseEvent):void
		{
			_stageRef.removeEventListener(MouseEvent.MOUSE_MOVE, moveWithMouse);
			_stageRef.removeEventListener(MouseEvent.MOUSE_UP, dragDone);
			trace('DRAG DONE.. ');
			
			_currentDisplayDropTarget = _collisionActive(_currentDisplayDrag);
			if(_currentDisplayDropTarget != null){
				_currentDisplayDropTarget.alpha = 1;
				AlignTo.Center(_currentDisplayDropTarget, _currentDisplayDrag);
				_dropTargetData[_currentDisplayDrag];
			}
		}
		
		private function moveWithMouse(event:MouseEvent):void
		{
			_currentDisplayDrag.x = _currentDisplayParent.mouseX - _offsetX;
			_currentDisplayDrag.y = _currentDisplayParent.mouseY - _offsetY;
			
			_collisionActive(_currentDisplayDrag);
		}
		
		private function collisionCircle():void{
			
		}
		
		private function collisionBox(_dragItem:DisplayObject):DisplayObject{
			var _dropTarget:DisplayObject;
			for(var i:int = 0; i < _dropTargetDisplays.length; i++){
				_dropTarget = _dropTargetDisplays[i] as DisplayObject;
				if(_dragItem.x >= _dropTarget.x && _dragItem.x + _dragItem.width <= _dropTarget.x + _dropTarget.width && _dragItem.y >= _dropTarget.y && _dragItem.y + _dragItem.height <= _dropTarget.y + _dropTarget.height){
					
					_dropTarget.alpha = .3;
					return _dropTarget;
				}
				else _dropTarget.alpha = 1; trace('NO HIT ....................');
			}
			
			return null;
		}
		
		protected function collisionCustom():void{
			
		}
	}
}