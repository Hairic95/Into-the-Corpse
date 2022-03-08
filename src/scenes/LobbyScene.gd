extends Node2D

signal change_scene(new_scene_key)

func _ready():
	pass

func _on_ZoneRibcage_pressed():
	emit_signal("change_scene", Constants.SceneKey_Dungeon, {"type": Constants.DungeonType_Ribcage})
