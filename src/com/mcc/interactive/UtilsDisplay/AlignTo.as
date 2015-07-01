package com.mcc.interactive.UtilsDisplay
{
	import flash.display.DisplayObject;

	public class AlignTo
	{
		public static function Center(alignBase:DisplayObject, alignObject:DisplayObject):void{
			alignObject.x = alignBase.x + alignBase.width*.5 - alignObject.width*.5;
			alignObject.y = alignBase.y + alignBase.height*.5 - alignObject.height*.5;
		}
	}
}