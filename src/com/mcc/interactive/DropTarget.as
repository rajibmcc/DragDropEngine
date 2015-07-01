package com.mcc.interactive
{
	public class DropTarget extends ElementDragDrop
	{
		private var _lockCatagory:Boolean;
		private var _dropCount:int;
		private var _dropLimit:int;
		public function DropTarget()
		{
		}

		public function get dropCount():int
		{
			return _dropCount;
		}

		public function set dropCount(value:int):void
		{
			_dropCount = value;
		}

		public function get dropLimit():int
		{
			return _dropLimit;
		}

		public function set dropLimit(value:int):void
		{
			_dropLimit = value;
		}

		public function get lockCatagory():Boolean
		{
			return _lockCatagory;
		}

		public function set lockCatagory(value:Boolean):void
		{
			_lockCatagory = value;
		}
		
		override public function get catagory():String{
			return _catagory;
		}
		
		override public function set catagory(value:String):void{
			_catagory = value;
		}

	}
}