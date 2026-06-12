package gse.lessons;

import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxSpriteContainer.FlxTypedSpriteContainer;
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

	var texts:FlxTypedSpriteContainer<FlxText>;

	var selected = 0;

	var camFollow:FlxObject;

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

		texts = new FlxTypedSpriteContainer<FlxText>();
		add(texts);

		for (i => file in list)
		{
			var text = new FlxText(0, 0, 0, Path.withoutDirectory(Path.withoutExtension(file)), 16);
			text.ID = i;

			texts.add(text);
		}

		camFollow = new FlxObject();
		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, 0.04);
		FlxG.camera.focusOn(camFollow.getPosition());

		changeSel(0);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed([ESCAPE]))
			FlxG.switchState(() -> new LessonCategorySelect());

		if (FlxG.sound?.music == null || !FlxG.sound?.music?.playing)
			FlxG.sound.playMusic(Paths.audio(Paths.music('TopicSelection')));

		if (FlxG.keys.anyJustPressed([W, UP]))
			changeSel(-1);
		if (FlxG.keys.anyJustPressed([S, DOWN]))
			changeSel(1);

		for (text in texts)
		{
			text.y = text.ID * (text.size * 2);
		}
	}

	function changeSel(amount:Int)
	{
		selected += amount;

		selected = Std.int(Math.min(Math.max(selected, 0), texts.length - 1));

		for (text in texts)
		{
			text.color = (selected == text.ID) ? FlxColor.YELLOW : FlxColor.WHITE;

			if (selected == text.ID) camFollow.y = text.y;
		}
	}
}
