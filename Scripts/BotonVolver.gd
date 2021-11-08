extends Node2D

func _ready():
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	$ColorRect2.color = Color("#7f48b00e")
	$Pulsa2.visible=true
	Global.volver = true
	Global.seguir = true
	
	pass 
