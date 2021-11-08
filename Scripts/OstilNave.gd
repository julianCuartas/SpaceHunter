extends Node2D

func _on_Area2D_area_entered(area):
# al eliminar un enemigo con la bala aumenta los puntos almacenados
# en el srcript global 
	if area.is_in_group("Bala"):
		Global.puntos += 50
		
		#Mandar sonido de explo
		Global.Sonido("Impacto")
		$Sprite/Explo.play("ExplosionAnimacion")
		$Sprite/Area2D.queue_free()
		$Sprite/nave.visible=false
		
	if area.is_in_group("Eliminar"):
		queue_free()


