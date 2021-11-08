extends Node2D


func _ready():
	Global.seguir = false
	Global.reintentar = false
	Global.volver = false
	$Inter/PuntajeResul.text=str(Global.puntos)
	$Inter/MayorPuntajeResul.text= str(Global.puntosGlobales)

func _process(delta):
	if Global.seguir:
		if Global.volver:
			if Input.is_action_pressed("Misil"):
				get_tree().change_scene("res://Escenas/Inicio.tscn")
		if Global.reintentar:
			if Input.is_action_pressed("Misil"):
				get_tree().change_scene("res://Escenas/Escena1.tscn")





func _on_Area2D_area_entered(area):
	$Botones/BotonReintentar/ColorRect.color = Color("#d5141415")
	$Botones/BotonVolver/ColorRect2.color = Color("#d5141415")
	$Botones/BotonReintentar/Pulsa.visible=false
	$Botones/BotonVolver/Pulsa2.visible=false
	
	Global.seguir = false
	Global.reintentar = false
	Global.volver = false
	
	
	
