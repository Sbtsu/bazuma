extends Area2D

var basura = preload("res://Objetos/Basuras/basura.tscn")
@export var maxima_basura = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout() -> void:
	if Global.cantidad_basura < maxima_basura:
		inst_basura(Vector2(randi() % 768, randi() % 64))

func inst_basura(pos):
	var instance = basura.instantiate()
	instance.position = pos
	add_child(instance)
	Global.cantidad_basura += 1
	print(Global.cantidad_basura)

# en este momento estamos resolviendo que las basuras se individualicen del area2d
