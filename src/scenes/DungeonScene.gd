extends Node2D

signal change_scene(new_scene_key, params)

func set_dungeon(dungeon_type):
	DungeonHandler.generate_dungeon(dungeon_type)
	
	
	show_options()

func show_options():
	$CanvasLayer/Label.text = str("Rooms: ", DungeonHandler.current_room_choice + 1, "/", DungeonHandler.room_choices.size())
	
	if DungeonHandler.current_room_choice < DungeonHandler.room_choices.size():
		for room in DungeonHandler.room_choices[DungeonHandler.current_room_choice]:
			var room_button = TextureButton.new()
			match(room.key):
				Constants.RoomKey_Battle:
					room_button.texture_normal = preload("res://assets/ui/dungeon/battle_room.png")
					room_button.connect("pressed", self, "start_battle", [room.battle_data])
				Constants.RoomKey_Respite:
					room_button.texture_normal = preload("res://assets/ui/dungeon/respite_room.png")
				Constants.RoomKey_Treasure:
					room_button.texture_normal = preload("res://assets/ui/dungeon/treasure_room.png")
			$CanvasLayer/Choices.add_child(room_button)

func start_battle(battle_data):
	emit_signal("change_scene", Constants.SceneKey_Battle, { "battle_data": battle_data })

