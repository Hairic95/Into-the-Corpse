extends Node

const combatant_data = {
	"fungal_grunt": {
		"name": "Fungal Grunt",
		"min_attack": 3,
		"max_attack": 5,
		"protection": 0,
		"max_hp": 16,
		"actions": ["basic_attack"],
		"animations": preload("res://assets/animations/combatants/FungalGruntAnim.tscn")
	},
	"spore_maiden": {
		"name": "Spore Maiden",
		"min_attack": 2,
		"max_attack": 4,
		"protection": 5,
		"max_hp": 24,
		"actions": ["basic_attack", "basic_poison"],
		"animations": preload("res://assets/animations/combatants/SporeMaidenAnim.tscn")
	},
	"colossal_spore": {
		"name": "Colossal Spore",
		"min_attack": 9,
		"max_attack": 12,
		"protection": 10,
		"max_hp": 60,
		"actions": ["basic_attack", "basic_poison"],
		"animations": preload("res://assets/animations/combatants/ColossalSporeAnim.tscn")
	},
	"blood_tear": {
		"name": "Blood Tear",
		"min_attack": 9,
		"max_attack": 11,
		"protection": 12,
		"max_hp": 23,
		"actions": ["basic_attack", "basic_bleed"],
		"animations": preload("res://assets/animations/combatants/BloodTearAnim.tscn")
	},
	"crimson_spear": {
		"name": "Crimson Spear",
		"min_attack": 8,
		"max_attack": 14,
		"protection": 8,
		"max_hp": 19,
		"actions": ["basic_attack", "basic_bleed"],
		"animations": preload("res://assets/animations/combatants/CrimsonSpearAnim.tscn")
	},
	"skelly": {
		"name": "Skelly",
		"min_attack": 6,
		"max_attack": 8,
		"protection": 20,
		"max_hp": 21,
		"actions": ["basic_attack"],
		"animations": preload("res://assets/animations/combatants/SkellyAnim.tscn")
	},
	"golem": {
		"name": "Golem",
		"min_attack": 4,
		"max_attack": 5,
		"protection": 35,
		"max_hp": 30,
		"actions": ["basic_attack"],
		"animations": preload("res://assets/animations/combatants/GolemAnim.tscn")
	},
	"bone_snake": {
		"name": "Bone Snake",
		"min_attack": 10,
		"max_attack": 12,
		"protection": 17,
		"max_hp": 18,
		"actions": ["basic_attack"],
		"animations": preload("res://assets/animations/combatants/BoneSnakeAnim.tscn")
	}
}

const action_data = {
	"basic_attack": {
		"name": "Basic Attack",
		"damage_percentage": 95,
		"target": Constants.ActionTarget_EnemySingle
	},
	"basic_heal": {
		"name": "Basic Heal",
		"target": Constants.ActionTarget_AllySingle,
		"effects": [{
			"type": Constants.EffectType_Heal,
			"amount": 15
		}]
	},
	"basic_group_heal": {
		"name": "Basic Group Heal",
		"target": Constants.ActionTarget_AllyMultiple,
		"effects": [{
			"type": Constants.EffectType_Heal,
			"amount": 7
		}]
	},
	"basic_bleed": {
		"name": "Basic Bleed",
		"damage_percentage": 65,
		"target": Constants.ActionTarget_EnemySingle,
		"effects": [{
			"name": "Bleed",
			"type": Constants.EffectType_Status,
			"status": Constants.StatusType_Bleed,
			"amount": 3,
			"turn_duration": 3,
			"icon": preload("res://assets/ui/status_icons/bleed.png")
		}]
	},
	"mega_bleed": {
		"name": "Mega Bleed",
		"damage_percentage": 125,
		"target": Constants.ActionTarget_EnemySingle,
		"effects": [{
			"name": "Bleed",
			"type": Constants.EffectType_Status,
			"status": Constants.StatusType_Bleed,
			"amount": 4,
			"turn_duration": 3,
			"icon": preload("res://assets/ui/status_icons/bleed.png")
		}],
		"self_effects": [{
			"name": "Bleed",
			"type": Constants.EffectType_Status,
			"status": Constants.StatusType_Bleed,
			"amount": 6,
			"turn_duration": 3,
			"icon": preload("res://assets/ui/status_icons/bleed.png")
		}]
	},
	"basic_poison": {
		"name": "Basic Poison",
		"damage_percentage": 25,
		"target": Constants.ActionTarget_EnemySingle,
		"effects": [{
			"name": "Poison",
			"type": Constants.EffectType_Status,
			"status": Constants.StatusType_Poison,
			"amount": 4,
			"turn_duration": 2,
			"icon": preload("res://assets/ui/status_icons/poison.png")
		}]
	},
	"clear_dot": {
		"name": "Clear DoT",
		"target": Constants.ActionTarget_AllySingle,
		"effects": [{
			"type": Constants.EffectType_ClearStatus,
			"status": Constants.StatusType_Bleed
		}, {
			"type": Constants.EffectType_ClearStatus,
			"status": Constants.StatusType_Poison
		}]
	},
	"basic_area_attack": {
		"name": "Basic Area Attack",
		"damage_percentage": 70,
		"target": Constants.ActionTarget_EnemyMultiple,
		"effects": [{
			"type": Constants.EffectType_Buff,
			"buff_type": Constants.BuffType_Malus,
			"buff_amount_type": Constants.BuffAmountType_Flat,
			"stat_type": Constants.StatType_Protection,
			"amount": -10,
			"turn_duration": 3,
			"icon": preload("res://assets/ui/status_icons/malus.png")
		}]
	}
}
