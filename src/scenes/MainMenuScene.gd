extends Node2D

signal change_scene(new_scene_key)

func _ready():
	pass

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_NewGameButton_pressed():
	emit_signal("change_scene", Constants.SceneKey_Cutscene)
