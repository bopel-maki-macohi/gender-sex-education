package gse.lessonCategory;

enum abstract LessonCategory(String) from String to String
{
	var GENDER = 'gender';
	var SEXUALITY = 'sexuality';

	public function toUpperCase():String
		return this.toUpperCase();
}
