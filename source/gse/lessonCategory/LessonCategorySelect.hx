package gse.lessonCategory;

import gse.lessons.LessonSelect;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxG;
import flixel.FlxState;

class LessonCategorySelect extends FlxState
{
	var genderText:FlxText = new FlxText(0, 0, 0, LessonCategory.GENDER.toUpperCase(), 16);
	var sexualityText:FlxText = new FlxText(0, 0, 0, LessonCategory.SEXUALITY.toUpperCase(), 16);

	var selected = 0;

	override function create()
	{
		super.create();

		add(genderText);
		add(sexualityText);

		genderText.screenCenter();
		sexualityText.screenCenter();

		genderText.x -= genderText.width;
		sexualityText.x += sexualityText.width;

		changeSel(0);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound?.music == null || !FlxG.sound?.music?.playing)
			FlxG.sound.playMusic(Paths.audio(Paths.music('TopicSelection')));

		if (FlxG.keys.anyJustPressed([A, LEFT]))
			changeSel(-1);
		if (FlxG.keys.anyJustPressed([D, RIGHT]))
			changeSel(1);
		
		if (FlxG.keys.anyJustPressed([ENTER]))
			FlxG.switchState(() -> new LessonSelect((selected == 0) ? GENDER : SEXUALITY));
	}

	function changeSel(amount:Int)
	{
		selected += amount;

		selected = Std.int(Math.min(Math.max(selected, 0), 1));

		genderText.color = (selected == 0) ? FlxColor.YELLOW : FlxColor.WHITE;
		sexualityText.color = (selected == 1) ? FlxColor.YELLOW : FlxColor.WHITE;
	}
}
