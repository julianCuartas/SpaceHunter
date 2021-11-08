extends Node2D
var cantidadEnemigos = 0 
var cantidadAsteroides = 0
var enemigosNoAsesinados= 0

var enemigoCargado = preload("res://Escenas/Enemigo.tscn")
var asteroideCargado = preload("res://Escenas/asteroide.tscn")

func _ready():
	Global.vida=100
	Global.puntos=0
	$Node2D/AudioStreamPlayer2D.play()
	

func _process(delta):
	if Global.vida==0:
		get_tree().change_scene("res://Escenas/Perder.tscn")
		

func _on_Timer_timeout():
	randomize()
	var randomEnemigo = round(rand_range(1,2))
	if randomEnemigo == 1 :
		var enemigo = enemigoCargado.instance()
		get_parent().call_deferred("add_child",enemigo)
		enemigo.position.x= round(rand_range(24,1000))
		enemigo.add_to_group("asteroide")
		cantidadEnemigos += 1
	if randomEnemigo == 2 :
		var asteroide = asteroideCargado.instance()
		get_parent().call_deferred("add_child",asteroide)
		asteroide.position.x= round(rand_range(24,1000))
		asteroide.add_to_group("asteroide")
		cantidadAsteroides += 1
	
	
	
func _physics_process(delta):
	$Interfaz/CanvasLayer/Node2D/Resul.text = str(Global.puntos)
	$Game/ParallaxBackground/ParallaxLayer.motion_offset.y +=5

func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Ostil"):
		enemigosNoAsesinados+=1
	pass # Replace with function body.
