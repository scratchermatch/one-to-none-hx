package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	final TILE_WIDTH:Int = 16;
	final TILE_HEIGHT:Int = 16;

	var settingsButton:FlxButton;
	var settingsOpen:Bool = false;
	var settingsSub:SettingsSubState;

	var terrain:FlxTilemap;

	override public function create()
	{
		settingsButton = new FlxButton(0, 0, "Settings", settingsButtonClicked);
		add(settingsButton);
		terrain = new FlxTilemap();
		terrain.loadMapFrom2DArray(generateTerrainChunk(
			Std.int(FlxG.height / TILE_HEIGHT),
			Std.int(FlxG.width / TILE_WIDTH), 1, 1),
			"assets/images/tilesets/testtileset.png", TILE_WIDTH, TILE_HEIGHT,
			FlxTilemapAutoTiling.OFF);
		add(terrain);
		terrain.screenCenter();
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function generateTerrainChunk(rows:Int, cols:Int, x:Int, y:Int):Array<Array<Int>>{
		//x and y are the top left corner
		var chunk:Array<Array<Int>> = [];
		for (i in 0...rows){
			chunk.push([]);
			for (j in 0...cols){
				chunk[i].push(generateTerrainTile(x + j, y + i));
			}
		}

		return chunk;
	}

	function generateTerrainTile(x:Int, y:Int):Int{
		//Magical generation function that returns which tile is located at x, y
		return Math.floor(Std.random(51));
	}

	function settingsButtonClicked():Void{
		if (settingsOpen) {
			settingsSub.close();
		} else {
			settingsSub = new SettingsSubState();
			openSubState(settingsSub);
		}
		settingsOpen = !settingsOpen;
	}
}
