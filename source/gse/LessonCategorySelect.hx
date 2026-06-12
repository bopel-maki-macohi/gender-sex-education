package gse;

import flixel.FlxG;
import flixel.FlxState;

class LessonCategorySelect extends FlxState
{
	override function create()
	{
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound?.music == null || !FlxG.sound?.music?.playing)
			FlxG.sound.playMusic(Paths.audio(Paths.music('TopicSelection')));
	}
}
