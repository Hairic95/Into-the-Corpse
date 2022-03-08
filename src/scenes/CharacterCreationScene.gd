extends Node2D

signal change_scene(new_scene_key)

var attack = 1
var protection = 1
var health = 1

var remaining_points = 4

func _ready():
	set_attack()
	set_protection()
	set_health()
	
	set_remaining_points()
	set_buttons()

func _on_Continue_pressed():
	PlayerHandler.set_player(health, attack, protection)
	emit_signal("change_scene", Constants.SceneKey_Lobby)

func set_attack():
	$Attack.text = str(attack)
func set_protection():
	$Protection.text = str(protection)
func set_health():
	$Health.text = str(health)

func set_remaining_points():
	$PointsLabel.text = str("Points Remaining: ", remaining_points)

func set_buttons():
	if remaining_points <= 0:
		$HealthUp.disabled = true
		$AttackUp.disabled = true
		$ProtectionUp.disabled = true
		$Continue.disabled = false
	else:
		$HealthUp.disabled = false
		$AttackUp.disabled = false
		$ProtectionUp.disabled = false
		$Continue.disabled = true
	if health <= 1:
		$HealthDown.disabled = true
	else:
		$HealthDown.disabled = false
	if attack <= 1:
		$AttackDown.disabled = true
	else:
		$AttackDown.disabled = false
	if protection <= 1:
		$ProtectionDown.disabled = true
	else:
		$ProtectionDown.disabled = false

func _on_HealthUp_pressed():
	if remaining_points > 0 && health < 5:
		health += 1
		remaining_points -= 1
		set_health()
		set_remaining_points()
	set_buttons()

func _on_HealthDown_pressed():
	if health > 1:
		health -= 1
		remaining_points += 1
		set_health()
		set_remaining_points()
	set_buttons()

func _on_AttackUp_pressed():
	if remaining_points > 0 && attack < 5:
		attack += 1
		remaining_points -= 1
		set_attack()
		set_remaining_points()
	set_buttons()

func _on_AttackDown_pressed():
	if attack > 1:
		attack -= 1
		remaining_points += 1
		set_attack()
		set_remaining_points()
	set_buttons()

func _on_ProtectionUp_pressed():
	if remaining_points > 0 && protection < 5:
		protection += 1
		remaining_points -= 1
		set_protection()
		set_remaining_points()
	set_buttons()

func _on_ProtectionDown_pressed():
	if protection > 1:
		protection -= 1
		remaining_points += 1
		set_protection()
		set_remaining_points()
	set_buttons()
