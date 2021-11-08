extends Node2D


func _ready():
	Global.seguir=false
	$MusicaTuto/Musicatuto.play()
	

func _process(delta):
	
	if Global.seguir:
		if Input.is_action_pressed("Misil"):
			get_tree().change_scene("res://Escenas/Eleccion.tscn")

func _physics_process(delta):
	$Fondo/ParallaxBackground/ParallaxLayer.motion_offset.y +=0.2


# 164 11 11 127
func _on_Area2D_area_entered(area):
	if area.is_in_group("Cursor"):
		$Interfaz/ColorRect.color = Color("#7f48b00e")
		$Interfaz/Label.text="Presiona el \n Botón A \n o la tecla \nespacio"
		Global.seguir=true
