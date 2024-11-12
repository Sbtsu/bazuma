extends Area2D

var basura_base = preload("res://Objetos/Basuras/basura_base.tscn")
var basura_aprovechable_cerveza = preload("res://Objetos/Basuras/basura_aprovechable_cerveza.tscn")
var basura_aprovechable_plastico = preload("res://Objetos/Basuras/basura_aprovechable_plastico.tscn")
var basura_no_aprovechable_amalgama = preload("res://Objetos/Basuras/basura_no_aprovechable_amalgama.tscn")
var basura_organica_manzana = preload("res://Objetos/Basuras/basura_organica_manzana.tscn")

@export var basura_pos_x = 32
@export var basura_pos_y = 384
var random_index_basura = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout() -> void:
	if Global.cantidad_basura < Global.puntos_max:
		var random_index_basura = randi() % 3
		print("index de basura actual es: ", random_index_basura)
		if random_index_basura == 0:
			inst_basura_organica_manzana(Vector2(randi() % basura_pos_y, randi() % basura_pos_x))
		elif random_index_basura == 1:
			inst_basura_aprovechable_plastico(Vector2(randi() % basura_pos_y, randi() % basura_pos_x))
		elif random_index_basura == 2:
			inst_basura_no_aprovechable_amalgama(Vector2(randi() % basura_pos_y, randi() % basura_pos_x))

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

func inst_basura_organica_manzana(pos):
	var instance = basura_organica_manzana.instantiate()
	instance.position = pos
	add_child(instance)
	Global.cantidad_basura += 1
	print("el numero actual de basuras en la escena es: ", Global.cantidad_basura)

func inst_basura_no_aprovechable_amalgama(pos):
	var instance = basura_no_aprovechable_amalgama.instantiate()
	instance.position = pos
	add_child(instance)
	Global.cantidad_basura += 1
	print("el numero actual de basuras en la escena es: ", Global.cantidad_basura)

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("Basura"):
		remove_child(area)

# en este momento estamos resolviendo que las basuras se individualicen del area2d
