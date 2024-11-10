extends Area2D

var basura = preload("res://Objetos/Basuras/basura.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inst_basura(Vector2(randi() % 384, randi() % 64))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func inst_basura(pos):
	var instance = basura.instantiate()
	instance.position = pos
	add_child(instance)
