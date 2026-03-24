extends CharacterBody2D

var  velocidadY = 500
var  velocidadX = 100

func _ready() -> void:
	velocity.y = velocidadY
	velocity.x = velocidadX
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		if round(collision.get_normal().y) == 0:
			velocity.x *= -1
		elif round(collision.get_normal().x) == 0:
			velocity.y *= -1
		if collision.get_collider().collision_layer == 8 :
			print("le di")
			collision.get_collider().queue_free()		

		
