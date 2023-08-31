package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;

class PlayState extends FlxState
{
	var settingsButton:FlxButton;
	var settingsOpen:Bool = false;
	var settingsSub:SettingsSubState;

	var terrain:FlxTilemap;

	override public function create()
	{
		settingsButton = new FlxButton(0, 0, "Settings", settingsButtonClicked);
		add(settingsButton);
		terrain = new FlxTilemap();
		terrain.loadMapFrom2DArray(generateTerrainChunk(10, 10, 1, 1),
		"assets/images/tilesets/testtileset.png", 16, 16,
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
		return Math.floor(Math.random() * 51);
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
