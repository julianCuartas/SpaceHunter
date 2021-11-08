extends Node2D


func _on_Area2D_area_entered(area):
	$ColorRect.color = Color("#7f48b00e")
	$Pulsa.visible=true
	Global.nave=2
	Global.seguir=true
	pass # Replace with function body.
