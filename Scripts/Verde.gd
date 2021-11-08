extends Node2D


func _ready():
	pass # Replace with function body.



func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Cursor"):
		print("hola")
		$Label.text = "Para continuar\n \n Coloca el \n cursor en esta \n zona"
		$ColorRect.color = Color("#7fa40b0b")
		Global.seguir=false
	
	pass # Replace with function body.
