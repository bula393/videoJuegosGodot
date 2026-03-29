extends Node2D

@onready var ball = get_node("ball")
@onready var derrota = get_node("derrota")
# @onready var enemigo = get_node("victoria")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if(ball.global_position.y >= 650):
		derrota.visible = true
		


func _on_play_again_pressed() -> void:
	get_tree().reload_current_scene()
