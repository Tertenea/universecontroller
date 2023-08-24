extends Node2D

func _on_gonext_pressed():
	var world_scene = "res://World.tscn"
	get_tree().change_scene(world_scene)

func _on_quitw_pressed():
	var menu_scene = "res://menu.tscn"
	get_tree().change_scene(menu_scene)
