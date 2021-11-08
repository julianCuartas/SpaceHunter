extends KinematicBody2D


export (int) var speed = 200
var vel= Vector2()

func _physics_process(delta):
#a cada accion de entrada movimiento
	get_input()
	vel = move_and_slide(vel)


func get_input():
	vel = Vector2()
	var izquierda= Input.is_action_pressed("Izquierda")
	var derecha = Input.is_action_pressed("Derecha")
	var disparo = Input.is_action_pressed("Bala")
	
	
	
	# Movimineto y normalización (reduccion de movimiento)
	if izquierda:
		vel.x-=1
	if derecha:
		vel.x+=1
	vel= vel.normalized()*speed

