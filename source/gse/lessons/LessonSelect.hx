package gse.lessons;

import gse.lessonCategory.LessonCategorySelect;
import flixel.FlxG;
import gse.lessonCategory.LessonCategory;
import flixel.FlxState;

class LessonSelect extends FlxState
{
	var category:LessonCategory;

	override public function new(category:LessonCategory)
	{
		super();

		this.category = category;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed([ESCAPE]))
			FlxG.switchState(() -> new LessonCategorySelect());
	}
}
