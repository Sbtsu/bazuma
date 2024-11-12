extends Node2D

var ganar = preload("res://Escenas/UI/escena_ganar.tscn")
var perder = preload("res://Escenas/UI/escena_perder.tscn")
var nivel_1 = "res://Escenas/Niveles/Nivel_1.tscn"
var nivel_2 = "res://Escenas/Niveles/Nivel_2.tscn"
var nivel_3 = "res://Escenas/Niveles/Nivel_3.tscn"
var nivel_4 = "res://Escenas/Niveles/Nivel_4.tscn"
var nivel_5 = "res://Escenas/Niveles/Nivel_5.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.cantidad_basura == Global.puntos_max:
		Global.juego_fin = true
		#print("fin del nivel")
	if Global.juego_fin == true and Global.puntos == Global.puntos_max:
		var instance = ganar.instantiate()
		add_child(instance)
	elif Global.juego_fin == true and Global.cantidad_basura_perdida == Global.puntos_max:
		var instance = perder.instantiate()
		add_child(instance)
		print("perdiste")
	if Global.index_escena_siguiente == 1:
		Global.escena_siguiente = nivel_1
	elif Global.index_escena_siguiente == 2:
		Global.escena_siguiente = nivel_2
	elif Global.index_escena_siguiente == 3:
		Global.escena_siguiente = nivel_3
	elif Global.index_escena_siguiente == 4:
		Global.escena_siguiente = nivel_4
	elif Global.index_escena_siguiente == 5:
		Global.escena_siguiente = nivel_5
