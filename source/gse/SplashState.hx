package gse;

import flixel.FlxG;
import flixel.FlxState;

class SplashState extends FlxState
{
	override public function create()
	{
		super.create();

		leave();
	}

	function leave()
	{
		FlxG.switchState(() -> new LessonCategorySelect());
	}
}
