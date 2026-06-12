package gse;

class Paths
{
	public static function path(file:String)
		return 'assets/$file';

	public static function data(file:String)
		return path('data/$file');

	public static function image(file:String)
		return path('images/$file');

	public static function sound(file:String)
		return path('sounds/$file');

	public static function music(file:String)
		return path('music/$file');

	public static function png(file:String)
		return '$file.png';

	public static function audio(file:String)
		return '$file.wav';
}
