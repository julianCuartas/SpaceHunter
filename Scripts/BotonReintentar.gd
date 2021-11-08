extends Node2D




func _ready():
	
	pass 


func _on_Area2D_area_entered(area):
	$ColorRect.color = Color("#7f48b00e")
	$Pulsa.visible=true
	Global.reintentar = true
	Global.seguir = true
	pass # Replace with function body.
