extends Node

var room_choices = []
var current_room_choice = 0

func _ready():
	pass

func generate_dungeon(dungeon_type, dungeon_size = 9, has_boss = false):
	
	room_choices = []
	current_room_choice = 0
	
	var rooms = []
	var treasure_room_quantity = 1 + int(dungeon_size / 2)
	var respite_room_quantity = 1 + int(dungeon_size / 2)
	
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
		
		
	
