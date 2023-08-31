package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxBaseTilemap;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	var settingsButton:FlxButton;
	var settingsOpen:Bool = false;
	var settingsSub:SettingsSubState;

	override public function create()
	{
		settingsButton = new FlxButton(0, 0, "Settings", settingsButtonClicked);
		add(settingsButton);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function settingsButtonClicked()
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
