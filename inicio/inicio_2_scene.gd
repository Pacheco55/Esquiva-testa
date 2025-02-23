extends Node2D



func _ready():
	#Music._play_music_level()  #para que se reprodusca la musica , esene de MUsucGrl previamante cargadda en project settings autoload
	
	$AnimationPlayer.play("fade_in")
	await(get_tree().create_timer(2).timeout)
	$AnimationPlayer.play("fade_out")
	await(get_tree().create_timer(1).timeout)
	get_tree().change_scene_to_file("res://main.tscn")
