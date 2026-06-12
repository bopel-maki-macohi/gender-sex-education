package gse;

import flixel.FlxG;
import flixel.FlxState;

class LessonCategorySelect extends FlxState {

    override function create() {
        super.create();

        FlxG.sound.playMusic(Paths.audio(Paths.music('TopicSelection')));
    }
}
