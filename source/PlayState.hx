package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import hxnoise.Perlin;

class PlayState extends FlxState {
	//Tiling Variables
	final TILE_WIDTH:Int = 16;
	final TILE_HEIGHT:Int = 16;

	private var perlin:Perlin;

	var terrain:FlxTilemap;

	//Substates
	var settingsButton:FlxButton;
	var settingsOpen:Bool = false;
	var settingsSub:SettingsSubState;

	var techButton:FlxButton;
	var techSub:TechSubState;

	//Sprites
	var coreunit:CoreUnit;

	override public function create()
	{
		settingsButton = new FlxButton(0, 0, "Settings", settingsButtonClicked);
		techButton = new FlxButton(0, 200, "Tech Tree", techButtonClicked);
		
		coreunit = new CoreUnit(250, 250);

		perlin = new Perlin();

		terrain = new FlxTilemap();
		terrain.loadMapFrom2DArray(generateTerrainChunk(
			100,
			100, 1, 1),
			"assets/images/tilesets/testtileset.png", TILE_WIDTH, TILE_HEIGHT,
			FlxTilemapAutoTiling.OFF, 0);

		add(terrain);
		add(coreunit);
		add(settingsButton);
		add(techButton);
		terrain.screenCenter();

		FlxG.camera.follow(coreunit, FlxCameraFollowStyle.LOCKON);

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
		var t:Float = perlin.OctavePerlin(x / 8, y / 8, 0.1, 8, 0.25, 0.5);
		trace(t);
		if(t < 0.4){
			return 3; //3, water
		} else if (t < 0.45){
			return 8; //8, sand
		} else if (t < 0.55){
			return 33; //0, grass, tilemap error (?)
		} else {
			return 1; //1, stone
		}
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

	function techButtonClicked():Void{
		techSub = new TechSubState();
		openSubState(techSub);
	}
}