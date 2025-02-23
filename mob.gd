extends RigidBody2D

#var mob
#var direction = rotation

#var MIN_SPEED = 150
#var MAX_SPEED = 255
#var mob_types = ["shark", "xeno", "mother"]


func _ready():
	$AnimatedSprite.play()
	var mob_types = Array($AnimatedSprite.sprite_frames.get_animation_names())
	$AnimatedSprite.animation = mob_types.pick_random()
	#$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	#direction += randf_range(-PI/4, PI/4)
	#mob.set_linear_velocity(Vector2(randf_range(mob.MIN_SPEED, mob.MAX_SPEED),0).rotated(direction))
