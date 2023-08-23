extends Node2D



func _on_start_pressed():
	var world_scene = "res://World.tscn"
	get_tree().change_scene(world_scene)


func _on_quit_pressed():
	Engine.quit()
