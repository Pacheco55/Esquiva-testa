extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Valiste \n Cheto")
	await $MessageTimer.timeout
	$MessageLabel.text = " Dale Otravez \n Y \n EQUIVATE-STA ! !"
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	


func _on_start_button_pressed():
	#emit_signal("start_game")
	$StartButton.hide()
	start_game.emit()


func _on_message_timer_timeout():
	$MessageLabel.hide()


func _on_exit_pressed():
	get_tree().quit()

func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")
