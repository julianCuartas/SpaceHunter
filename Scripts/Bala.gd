extends KinematicBody2D


func _physics_process(delta):
	#movimiento de la bala
	position.y -= 20
	pass 

func _on_Area2D_area_entered(area):
#la bala tambien es eliminada al impactar con enemigos
	if area.is_in_group("Ostil"):
		queue_free()
	if area.is_in_group("Eliminar2"):
		queue_free()
