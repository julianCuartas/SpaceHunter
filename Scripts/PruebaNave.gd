extends KinematicBody2D
var vel= Vector2()
export (int) var speed = 200
var BalaCarga = preload("res://Escenas/bala.tscn")
#Disparo está listo
var listoParadisparar= true
#Manejo de barra de vida 
export var VidaMaxima=100
export var VidaActual=100
var vida
#Manejo de escudo
export var EscudoMaximo=100
export var EscudoActual=100
var escudo

#cambio de personaje
export (Image) var Personaje2



func _ready():

#Tomar los nodos con pertenecientes a cada etiqueta de grupo(Vida y escudo)
	vida = get_tree().get_nodes_in_group("HPJ1")[0]
	escudo= get_tree().get_nodes_in_group("Esc1")[0]
	if Global.nave == 2:
		$Sprite.texture = Personaje2
		$Sprite.light_mask=16
		$Sprite.rotate(3.14159)
		


func _physics_process(delta):
#a cada accion de entrada movimiento, actualizacion de vida y escudo
	get_input()
	vel= move_and_slide(vel)
	actualizaVida()
	actualizarEscudo()

# Funciones que realizan regla de tres para establecer la barra de escudo y 
# vida
func actualizarEscudo():
	escudo.value= EscudoActual * escudo.max_value / EscudoMaximo
func actualizaVida():
	vida.value= VidaActual * vida.max_value / VidaMaxima

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
	if disparo:
		disparo()
	vel= vel.normalized()*speed



func disparo():

#Genera los dos proyectiles del jugador
	if listoParadisparar:
		#intancia la escena de la bala (ya cargada)
		var bala1= BalaCarga.instance()
		var bala2= BalaCarga.instance()
		# agraga las dos balas como hijos
		get_parent().call_deferred("add_child",bala1)
		get_parent().call_deferred("add_child",bala2)
		#toma la posicion de la nave en X y Y
		bala1.position.x = self.position.x - 30
		bala1.position.y = self.position.y
		bala2.position.x = self.position.x + 30
		bala2.position.y = self.position.y
		
		# evita que dispare por un breve periodo de tiempo
		listoParadisparar = false
		#accede a su hijo que es un audio y lo reproduce
		$Sonidos/Laser.play()
		#crea un timer por 0.5 que evita que entre a este if
		yield(get_tree().create_timer(0.5),"timeout")
		#habilita el disparo
		listoParadisparar = true
		


func _on_Area2D_area_entered(area):
	#La nave al detectar un objeto pregunta su grupo y resta la vida 
	#correspondiente
	if area.is_in_group("Asteroide"):
		$Sonidos/Choque.play()
		$Light2D/AnimationPlayer.play("Choque")
		if EscudoActual < 0:
			VidaActual = VidaActual - 20
			if VidaActual<0:
				Global.vida=0
		else:
			EscudoActual = EscudoActual - 20

	if area.is_in_group("Enemigo"):
		$Sonidos/Choque.play()
		$Light2D/AnimationPlayer.play("Choque")
		if EscudoActual<0:
			VidaActual = VidaActual - 30
			if VidaActual<0:
				Global.vida=0
		else:
			EscudoActual = EscudoActual - 30
	pass


