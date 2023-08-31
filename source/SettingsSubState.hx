package;

import flixel.FlxSubState;
import flixel.text.FlxText;

class SettingsSubState extends FlxSubState
{
	var text:FlxText;

	override public function create()
	{
		_parentState.persistentUpdate = true;

		text = new FlxText(100, 200, 100, "Send Help", 20);
		add(text);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
