extends Node2D

var spawn_positions = null

var timer_speed = 1.0
var base_timer_interval = 2.0

var Enemy = preload("res://characters/enemy/Enemy.tscn")

func _ready():
	randomize()
	spawn_positions = $SpawnPositions.get_children()

func spawn_enemy():
	var index = randi() % spawn_positions.size()
	var enemy = Enemy.instance()
	enemy.global_position = spawn_positions[index].global_position
	enemy.connect("enemy_died", get_tree().current_scene, "score")
	add_child(enemy)

func _on_SpawnTimer_timeout():
	spawn_enemy()
