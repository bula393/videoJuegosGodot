extends Control





func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/game_basico.tscn")



func _on_close_pressed() -> void:
	get_tree().quit()
