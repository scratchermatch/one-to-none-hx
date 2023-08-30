package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

class MainSettingsState extends FlxState {
	private var menuButton:FlxButton;
	override public function create() {
		menuButton = new FlxButton(0, 0, "Back to Main Menu", menuButtonClicked);
		add(menuButton);
		super.create();
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	function menuButtonClicked(){
		FlxG.switchState(new MainMenuState());
	}
}
