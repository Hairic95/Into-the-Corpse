extends Node

var health_skill = 1
var attack_skill = 1
var protection_skill = 1
var action_skill = 2

var max_hp = 1
var current_hp = 1
var min_attack = 1
var max_attack = 1
var prot = 0

func _ready():
	set_player(1, 1, 1)

func set_player(health, attack, protection):
	health_skill = health
	attack_skill = attack
	protection_skill = protection
	
	max_hp = 24 + 6 * health_skill
	current_hp = max_hp
	
	min_attack = 5 + 2 * attack_skill
	max_attack = 7 + 3 * attack_skill
	
	protection = 4 + 6 * protection_skill

func get_player_combatant():
	return  {
		"name": "You",
		"min_attack": min_attack,
		"max_attack": max_attack,
		"actions_per_turn": action_skill,
		"protection": prot,
		"max_hp": max_hp,
		"current_hp": current_hp,
		"actions": ["basic_attack"],
		"animations": preload("res://assets/animations/combatants/PlayerAnim.tscn")
	}
