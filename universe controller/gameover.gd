extends Node2D

var score = 0

func score():
	score += 1
	$Score.text = "Score: " + str(score )


func _on_gonext_pressed():
	var world_scene = "res://World.tscn"
	get_tree().change_scene(world_scene)


func _on_quitw_pressed():
	var menu_scene = "res://menu.tscn"
	get_tree().change_scene(menu_scene)
