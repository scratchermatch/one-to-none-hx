package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

class MainMenuState extends FlxState {
	private var startButton:FlxButton;
	private var settingsButton:FlxButton;
	override public function create() {
		startButton = new FlxButton(0, 0, "Start \"Game\"", startButtonClicked);
		settingsButton = new FlxButton(100, 100, "Settings", settingsButtonClicked);
		add(startButton);
		add(settingsButton);
		super.create();
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	private function startButtonClicked(){
		FlxG.switchState(new PlayState());
	}

	private function settingsButtonClicked(){
		FlxG.switchState(new MainSettingsState());
	}
}
