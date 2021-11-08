extends Node2D

func _ready():
	pass



func _on_Area2D_area_entered(area):
	#7f48b00e
	$ColorRect2.color = Color("#7f48b00e")
	$Pulsa2.visible=true
	Global.nave=1
	Global.seguir=true
	pass # Replace with function body.
