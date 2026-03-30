extends CharacterBody2D

var  velocidadY = 500
var  velocidadX = 100

@onready var audiorebote : AudioStreamPlayer2D = $audiorebote 
@onready var audioestrellado : AudioStreamPlayer2D = $choque 

func _ready() -> void:
	velocity.y = velocidadY
	velocity.x = velocidadX
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	var orientacion
	if collision != null:
		if collision.get_collider().is_in_group("barra"):
			velocidadY = randi_range(100,490)
			if velocity.x > 0:
				orientacion = 1
			else: 
				orientacion = -1
			velocidadX = orientacion * (500 - velocidadY)
			velocity.y = velocidadY
			velocity.x = velocidadX

		if round(collision.get_normal().y) == 0:
			velocity.x *= -1
			audiorebote.play()
		elif round(collision.get_normal().x) == 0:
			velocity.y *= -1
			audiorebote.play()
		if collision.get_collider().collision_layer == 8 :
			collision.get_collider().queue_free()		
			audioestrellado.play()
			

		
