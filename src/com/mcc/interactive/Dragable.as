package com.mcc.interactive
{
	public class Dragable extends ElementDragDrop
	{
		private var _originX:Number;
		private var _originY:Number;
		private var _knockOut:Boolean;
		
		public function get knockOut():Boolean
		{
			return _knockOut;
		}

		public function set knockOut(value:Boolean):void
		{
			_knockOut = value;
		}

		public function get originY():Number
		{
			return _originY;
		}

		public function set originY(value:Number):void
		{
			_originY = value;
		}

		public function get originX():Number
		{
			return _originX;
		}

		public function set originX(value:Number):void
		{
			_originX = value;
		}
		
		override public function get catagory():String{
			return _catagory;
		}
		
		override public function set catagory(value:String):void{
			_catagory = value;
		}
	}
}