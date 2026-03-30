extends Node2D

@onready var ball = get_node("ball")
@onready var derrota = get_node("derrota")
@onready var soundGameover : AudioStreamPlayer2D = $derrota/gameover
@onready var soundGame : AudioStreamPlayer = $AudioStreamPlayer
@onready var victoria = get_node("victoria")
@onready var pause = get_node("pausa")
@onready var music = get_node("pausa/music")
@onready var musicoff = get_node("pausa/musicoff")
@onready var sound = get_node("pausa/sound")
@onready var soundoff = get_node("pausa/soundoff")
@onready var barra = get_node("barra")

var master_bus_index = AudioServer.get_bus_index("Master")



func _physics_process(delta: float) -> void:
	barra.position.y = 633
	if(ball.global_position.y >= 650):
		soundGameover.play()
		get_tree().paused = true
		derrota.visible = true
	elif (get_tree().get_nodes_in_group("BLOQUES").size() == 0):
		get_tree().paused = true
		victoria.visible = true
		


func _on_play_again_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/inicio{.tscn")


func _on_resume_pressed() -> void:
	pause.visible = false
	get_tree().paused = false
	


func _on_sound_pressed() -> void:
	AudioServer.set_bus_mute(master_bus_index, true)
	sound.visible = false 
	soundoff.visible = true


func _on_soundoff_pressed() -> void:
	AudioServer.set_bus_mute(master_bus_index, false)
	sound.visible =  true
	soundoff.visible = false


func _on_musicoff_pressed() -> void:
	music.visible = true
	musicoff.visible = false


func _on_music_pressed() -> void:
	soundGame.stop()
	music.visible = false
	musicoff.visible = true


func _on_pause_pressed() -> void:
	soundGame.play()
	pause.visible = true
	get_tree().paused = true
	
