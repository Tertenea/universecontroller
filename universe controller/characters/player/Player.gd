extends Area2D
class_name Player

signal spawn_laser(location)

onready var muzzle = $Muzzle

var speed = 500

var input_vector = Vector2.ZERO

var hp = 3

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	var new_pos = global_position + input_vector * speed * delta
	
	var screenSize = get_viewport_rect().size
	
	new_pos.x = clamp(new_pos.x, 0, screenSize.x)
	new_pos.y = clamp(new_pos.y, 0, screenSize.y)
	
	global_position = new_pos
	
	if Input.is_action_just_pressed("shoot"):
		$Pew.play()
		shoot_laser()
	
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		game_over()

func game_over():
	var game_over_scene = "res://gameover.tscn"
	get_tree().change_scene(game_over_scene)

func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)

