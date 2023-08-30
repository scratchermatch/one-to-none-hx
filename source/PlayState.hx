package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxBaseTilemap;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	var settings:FlxButton;
	var settingsOpen:Bool = false;
	var settingsSub:SettingsSubState;

	override public function create()
	{
		settings = new FlxButton(0, 0, "Settings", clickSettings);
		add(settings);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function clickSettings()
	{
		if (settingsOpen) {
			settingsSub.close();
		} else {
			settingsSub = new SettingsSubState();
			openSubState(settingsSub);
		}
		settingsOpen = !settingsOpen;
	}
}
