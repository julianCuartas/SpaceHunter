extends Node

var puntos =0
var puntosGlobales=0
var escudo = 100
var vida = 100
var nave = 1
var seguir= true

var volver =false
var reintentar =false
#func explosion(audio):
	
func _process(delta):
	if puntos > puntosGlobales:
		puntosGlobales = puntos
func Sonido(sonido):
	if sonido =="Impacto":
		get_node("/root/main/Node2D2/Impacto").play()
