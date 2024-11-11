extends Area2D

var basura_base = preload("res://Objetos/Basuras/basura_base.tscn")
var basura_aprovechable_cerveza = preload("res://Objetos/Basuras/basura_aprovechable_cerveza.tscn")
var basura_aprovechable_plastico = preload("res://Objetos/Basuras/basura_aprovechable_plastico.tscn")
var basura_organica_manzana = preload("res://Objetos/Basuras/basura_organica_manzana.tscn")

@export var maxima_basura = 0
var random_index_basura = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout() -> void:
	var random_index_basura = randi() % 3
	print(random_index_basura)
	if Global.cantidad_basura < maxima_basura:
		if random_index_basura == 0:
			inst_basura_organica_manzana(Vector2(randi() % 768, randi() % 64))
		elif random_index_basura == 1:
			inst_basura_aprovechable_plastico(Vector2(randi() % 768, randi() % 64))
		elif random_index_basura == 2:
			inst_basura_aprovechable_cerveza(Vector2(randi() % 768, randi() % 64))

func inst_basura(pos):
	var instance = basura_base.instantiate()
	instance.position = pos
	add_child(instance)
	Global.cantidad_basura += 1
	print("el numero actual de basura en la escena es: ", Global.cantidad_basura)

func inst_basura_aprovechable_plastico(pos):
	var instance = basura_aprovechable_plastico.instantiate()
	instance.position = pos
	add_child(instance)
	Global.cantidad_basura += 1
	print("el numero actual de basuras en la escena es: ", Global.cantidad_basura)

func inst_basura_aprovechable_cerveza(pos):
	var instance = basura_aprovechable_cerveza.instantiate()
	instance.position = pos
	add_child(instance)
	Global.cantidad_basura += 1
	print("el numero actual de basuras en la escena es: ", Global.cantidad_basura)

func inst_basura_organica_manzana(pos):
	var instance = basura_organica_manzana.instantiate()
	instance.position = pos
	add_child(instance)
	Global.cantidad_basura += 1
	print("el numero actual de basuras en la escena es: ", Global.cantidad_basura)

# en este momento estamos resolviendo que las basuras se individualicen del area2d
