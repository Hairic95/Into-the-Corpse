extends Node

var room_choices = []
var current_room_choice = 0
var current_dungeon_type = ""

func _ready():
	randomize()

func generate_dungeon(dungeon_type, dungeon_size = 5, has_boss = false):
	
	room_choices = []
	current_room_choice = 0
	
	current_dungeon_type = dungeon_type
	
	var rooms = []
	# TODO Implement these type of rooms
	var treasure_room_quantity = 0 # 1 + int(dungeon_size / 2)
	var respite_room_quantity = 0 # 1 + int(dungeon_size / 2)
	
	for i in treasure_room_quantity:
		rooms.append({
			"key": Constants.RoomKey_Treasure
		})
	for i in respite_room_quantity:
		rooms.append({
			"key": Constants.RoomKey_Respite
		})
	for i in (dungeon_size * 3 - treasure_room_quantity - respite_room_quantity):
		rooms.append({
			"battle_data": generate_enemy_team(dungeon_type),
			"key": Constants.RoomKey_Battle
		})
	
	rooms.shuffle()
	
	for i in dungeon_size:
		if rooms.size() < 3:
			break
		
		var room_1 = rooms.pop_front()
		var room_2 = rooms.pop_front()
		var room_3 = rooms.pop_front()
		
		room_choices.append([room_1, room_2, room_3])

func generate_enemy_team(dungeon_type):
	var available_enemies = []
	var enemy_team = []
	match (dungeon_type):
		Constants.DungeonType_Ribcage:
			available_enemies.append("skelly")
			available_enemies.append("skelly")
			available_enemies.append("skelly")
			available_enemies.append("skelly")
			available_enemies.append("skelly")
			available_enemies.append("golem")
			available_enemies.append("bone_snake")
			available_enemies.append("bone_snake")
		Constants.DungeonType_Blood:
			available_enemies.append("blood_tear")
			available_enemies.append("blood_tear")
			available_enemies.append("blood_tear")
			available_enemies.append("blood_tear")
			available_enemies.append("crimson_spear")
			available_enemies.append("crimson_spear")
			available_enemies.append("crimson_spear")
		Constants.DungeonType_Stomach:
			available_enemies.append("fungal_grunt")
			available_enemies.append("fungal_grunt")
			available_enemies.append("fungal_grunt")
			available_enemies.append("fungal_grunt")
			available_enemies.append("fungal_grunt")
			available_enemies.append("spore_maiden")
			available_enemies.append("spore_maiden")
	
	var enemy_party_size = randi() % 2 + 2
	available_enemies.shuffle()
	for i in enemy_party_size:
		enemy_team.append(
			{
				"id": available_enemies.pop_front()
			}
		)
	return enemy_team
