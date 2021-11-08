extends Node2D

func _ready():
	Global.seguir=false
	yield(get_tree().create_timer(1),"timeout")
	Global.seguir=true
	$musicaInicio/musicaInicio.play()

func _process(delta):

	if Input.is_action_pressed("Misil") and Global.seguir:
		get_tree().change_scene("res://Escenas/Tutorial.tscn")

func _physics_process(delta):
	$Fondo/ParallaxBackground/ParallaxLayer.motion_offset.y +=0.2
