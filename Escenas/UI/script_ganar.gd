extends Control

func _on_continue_pressed() -> void:
	Global.index_escena_siguiente += 1
	print(Global.index_escena_siguiente)
	Global.cantidad_basura = 0
	Global.cantidad_basura_perdida = 0
	Global.puntos = 0
	Global.juego_fin = false
	queue_free()
	get_tree().change_scene_to_file(Global.escena_siguiente)

func _on_retry_pressed() -> void:
	Global.cantidad_basura = 0
	Global.cantidad_basura_perdida = 0
	Global.puntos = 0
	Global.juego_fin = false
	get_tree().reload_current_scene()
	
