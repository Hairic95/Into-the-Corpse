extends Node2D


func _ready():
	DungeonHandler.generate_dungeon("")
	
	var x = 1
	for choice in DungeonHandler.room_choices:
		
		var y = 1
		for room in choice:
			
			var new_sprite = Sprite.new()
			match (room.key):
				Constants.RoomKey_Battle:
					new_sprite.texture = load("res://assets/ui/dungeon/battle_room.png")
				Constants.RoomKey_Respite:
					new_sprite.texture = load("res://assets/ui/dungeon/respite_room.png")
				Constants.RoomKey_Treasure:
					new_sprite.texture = load("res://assets/ui/dungeon/treasure_room.png")
			
			new_sprite.scale = Vector2(.2, .2)
			new_sprite.global_position = Vector2(x * 80, y * 80)
			
			add_child(new_sprite)
			
			y += 1
		
		x += 1
	

