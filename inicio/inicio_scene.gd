extends Node2D


func _ready():
	#Music._play_music_level()
	$AnimationPlayer.play("fade_in")
	await(get_tree().create_timer(4).timeout)
	$AnimationPlayer.play("fDE_OUT")
	await(get_tree().create_timer(2).timeout)
	get_tree().change_scene_to_file("res://main.tscn")
	
