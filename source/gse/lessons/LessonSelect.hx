package gse.lessons;

import haxe.io.Path;
import lime.utils.Assets;
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

	var list:Array<String> = [];

	override function create()
	{
		super.create();

		for (file in Assets.list(TEXT))
		{
			// trace(Path.extension(file));
			// trace(Path.directory(file));

			if (Path.extension(file) != 'json')
				continue;

			if (Path.directory(file) != Paths.data('$category'))
				continue;

			list.push(file);
		}

		trace(list);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed([ESCAPE]))
			FlxG.switchState(() -> new LessonCategorySelect());
	}
}
