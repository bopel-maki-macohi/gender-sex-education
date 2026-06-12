package gse.lessons;

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
}
