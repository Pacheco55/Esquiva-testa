extends Area2D

signal hit 

var SPEED = 450
#var velocity = Vector2()
var screensize

func _ready():
	#$AnimatedSprite2D.hide()
	screensize = get_viewport_rect().size
	hide()
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if velocity.length() > 0 :
		$AnimatedSprite2D.play("idle")
		velocity = velocity.normalized() * SPEED
	#else:
	#	$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screensize)
	#position.x = clamp(position.x, 0, screensize.x)
	#position.y = clamp(position.y, 0, screensize.y)
	
	if velocity.x != 0 :
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.flip_v =false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0 :
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.y > 0


func start(pos):
	position = pos
	rotation = 0
	show()
	$CollisionShape2D.disabled = false
	#monitoring = true
	#$AnimatedSprite2D.show()
	
	
#func _on_Player_body_entered(_body):
	#hide()
	#hit.emit()
	#emit_signal("hit")
	#$CollisionShape2D.set_deferred("disabled", true) #("disabled", true)
	#call_deferred("set_monitoring", true)


func _on_body_entered(body):
	hide()
	hit.emit()
	#emit_signal("hit")
	$CollisionShape2D.set_deferred(&"disabled", true)
