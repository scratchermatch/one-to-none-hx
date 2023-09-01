package;

import flixel.FlxG;
import flixel.FlxSprite;

class CoreUnit extends FlxSprite {
	var speed:Int = 100;

    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
		drag.x = speed;
		drag.y = speed;
		loadGraphic("assets/images/sprites/player.png");
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
		movement();
    }

	private function movement(){
		final right = FlxG.keys.anyPressed([RIGHT, D]); //For keybindings in the
		final left = FlxG.keys.anyPressed([LEFT, A]); //future, these could be
		final up = FlxG.keys.anyPressed([UP, W]); //rebound while playing. Maybe
		final down = FlxG.keys.anyPressed([DOWN, S]); //Shouldn't be final.
		//Despite the fact that these are final, moving them out of the function
		//breaks the movement. It is unclear why.
		if(right && left){
			velocity.x = 0; //velocity is baked into the sprite class.
			return;
		}
		if(up && down){
			velocity.y = 0;
			return;
		}
		if (right){
			velocity.x = speed;
		}
		if (left){
			velocity.x = -speed;
		}
		if (up){
			velocity.y = -speed; //remember that y increases going down
		}
		if (down){
			velocity.y = speed;
		}
	}
}