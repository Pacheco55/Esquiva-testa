extends Node

var score
@export var mob_scene: PackedScene

func _ready():
	$Player/AnimatedSprite2D.play()
	#$AnimatedSprite.play()
#	randomize()

#func game_over():
#	$ScoreTimer.stop()
#	$MobTimer.stop()
#	$HUD.show_game_over()
	
func new_game ():
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	get_tree().call_group("mobs", "queue_free")
	score = 0
	$Player.start($Startposition.position)
	#$HUD.connect("start_game")
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("PONTE V3r$@ \n ...atras")
	#$MobTimer.start()
	#$ScoreTimer.start(


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")#get_node(^"MobPath/MobSpawnLocation")
	mob_spawn_location.progress = randi()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position
	#$MobPath/MobSpawnLocation.position


	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	#mob.rotation = $MobPath/MobSpawnLocation.rotation


	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
#var 	mob = mob_scene.instantiate()
#	add_child(mob)
#	mob.position =# $Mob.position
#	mob.rotation = $Mob.rotation
#
#	mob.position = $MobPath/MobSpawnLocation.position


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	#$HUD.hide()
	#$Player.start()


func _on_player_hit():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	
