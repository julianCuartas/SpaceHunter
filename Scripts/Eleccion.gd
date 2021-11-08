extends Node2D

func _ready():
	Global.seguir=false
	$MusicaTuto/Musicatuto.play()

func _process(delta):
	if Global.seguir:
		if Input.is_action_pressed("Misil"):
			get_tree().change_scene("res://Escenas/Escena1.tscn")

func _on_Area2D_area_entered(area):

	$Naves/Nave1/ColorRect2.color = Color("#d5141414")
	$Naves/Nave2/ColorRect.color = Color("#d5141414")
	$Naves/Nave1/Pulsa2.visible=false
	$Naves/Nave2/Pulsa.visible=false
	Global.seguir=false
	Global.nave=1
	
	pass # Replace with function body.
