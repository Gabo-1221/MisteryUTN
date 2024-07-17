extends AudioStreamPlayer2D

func _ready():
	connect("finished",Callable(self, "_on_AudioStreamPlayer_finished"))
	reproducir_musica()

func reproducir_musica():
	play()

func _on_finished():
	reproducir_musica()

