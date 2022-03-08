extends Node2D

signal change_scene(new_scene_key)

func _ready():
	pass
func start_cutscene():
	$AnimationPlayer.play("CutScene")

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_SPACE:
			_on_SkipCutsceneTimer_timeout()

func _on_SkipCutsceneTimer_timeout():
	emit_signal("change_scene", Constants.SceneKey_CharacterCreation)


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("change_scene", Constants.SceneKey_CharacterCreation)
