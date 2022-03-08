extends TextureRect

# how far the overlays can move from their origin
var amplitude = 40.0

func _process(delta):
	$TextureRectCyan.rect_position = Vector2.RIGHT.rotated(TAU*randf())*amplitude*randf()
	$TextureRectYellow.rect_position = Vector2.RIGHT.rotated(TAU*randf())*amplitude*randf()
	$TextureRectMagenta.rect_position = Vector2.RIGHT.rotated(TAU*randf())*amplitude*randf()
	pass
