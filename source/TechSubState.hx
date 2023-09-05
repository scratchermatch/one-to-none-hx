package;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class TechSubState extends FlxSubState
{
	var text:FlxText;
	var backButton:FlxButton;

	override public function create()
	{
		text = new FlxText(100, 200, 100, "Tech Help", 20);
		backButton = new FlxButton(100, 100, "Back", backButtonClicked);
		add(text);
		add(backButton);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function backButtonClicked():Void{
		this.close();
	}
}
