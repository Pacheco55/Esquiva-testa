extends AudioStreamPlayer2D

const level_music = preload("res://fondo sin melodia.wav")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = level_music
	volume_db = volume
	play()
	
func _play_music_level():
	_play_music(level_music)

	#     Music._play_music_level()
	#la linea de arriba se escribe en la escena que se empezaara a reproducir la musica , previamente cargado este script a autoload en project settings
