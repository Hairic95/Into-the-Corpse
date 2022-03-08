extends Node

var screen_black = true

var scenes = {
	Constants.SceneKey_MainMenu: load("res://src/scenes/MainMenuScene.tscn"),
	Constants.SceneKey_Cutscene: load("res://src/scenes/CutScene.tscn"),
	Constants.SceneKey_CharacterCreation: load("res://src/scenes/CharacterCreationScene.tscn"),
	Constants.SceneKey_Lobby: load("res://src/scenes/LobbyScene.tscn"),
	Constants.SceneKey_Dungeon: load("res://src/scenes/DungeonScene.tscn"),
	Constants.SceneKey_Battle: load("res://src/scenes/BattleScene.tscn")
}

func _ready():
	_load_scene(Constants.SceneKey_MainMenu)

func _load_scene(new_scene_key, scene_parameters = null):
	fade_out()
	yield(get_tree().create_timer(1), "timeout")
	if scenes.has(new_scene_key):
		for scene in $CurrentScene.get_children():
			scene.queue_free()
		var new_scene = scenes[new_scene_key].instance()
		new_scene.connect("change_scene", self, "_load_scene")
		$CurrentScene.add_child(new_scene)
		fade_in()
		yield(get_tree().create_timer(1.25), "timeout")
		
		if weakref(new_scene).get_ref():
			match(new_scene_key):
				Constants.SceneKey_Cutscene:
					new_scene.start_cutscene()
				Constants.SceneKey_Dungeon:
					new_scene.set_dungeon(scene_parameters.type)
				Constants.SceneKey_Battle:
					new_scene.start_battle(scene_parameters.battle_data)

func fade_out():
	$CanvasLayer/ColorRect/Tween.interpolate_property($CanvasLayer/ColorRect, "modulate",
			$CanvasLayer/ColorRect.modulate, Color(0, 0, 0, 1), 1)
	
	$CanvasLayer/ColorRect/Tween.start()
	screen_black = true

func fade_in():
	$CanvasLayer/ColorRect/Tween.interpolate_property($CanvasLayer/ColorRect, "modulate",
			$CanvasLayer/ColorRect.modulate, Color(0, 0, 0, 0), 1.2)
	
	$CanvasLayer/ColorRect/Tween.start()
	screen_black = false
