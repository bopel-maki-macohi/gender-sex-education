package gse;

import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class SplashState extends FlxState
{
	override public function create()
	{
		super.create();

		var splash:FlxSprite = new FlxSprite(0, 0, Paths.png(Paths.image('splashArt')));
		add(splash);
		splash.screenCenter();

		FlxTimer.wait(1, leave);
	}

	function leave()
	{
		FlxG.switchState(() -> new gse.lessonCategory.LessonCategorySelect());
	}
}
