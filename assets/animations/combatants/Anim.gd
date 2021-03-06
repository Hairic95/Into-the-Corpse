extends Node2D

func _ready():
	randomize()
	if has_node("Anim") && $Anim.has_animation("Idle"):
		$Anim.play("Idle")
		$Anim.advance(randf() * 2)

# Position where to put the target UI and effects
func get_target_position():
	return $TargetPosition.global_position

# basic KO change of sprites
func toggle_ko(value):
	if has_node("Ko"):
		$Ko.visible = value
