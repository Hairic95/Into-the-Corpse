extends Node2D

func _ready():
	
	$AnimationPlayer.play("Hover")

func set_number(damage, color):
	$Label.text = str(damage)
	$Label.add_color_override("font_color", color)




func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name != "Fade":
		$AnimationPlayer.play("Fade")
	else:
		queue_free()
