extends RigidBody2D


@export var is_clicked = false
@export var on_basura = false

func _on_area_2d_mouse_entered() -> void:
	on_basura = true
	print("mouse entro en basura")

func _on_area_2d_mouse_exited() -> void:
	on_basura = false
	print("mouse salio de basura")

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and on_basura == true:
		is_clicked = true
		print("Basura presionada")

func when_basura_clicked():
	if is_clicked == true:
		constant_force.x = 0
		linear_velocity.x = 0
		position = get_global_mouse_position() - Vector2(896, 240)

func _physics_process(delta):
	when_basura_clicked()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("caneca_aprovechable") and is_in_group("aprovechable"):
		Global.puntos += 1
		print("una basura entro en: aprovechable")
		print(Global.puntos)
		queue_free()
	if area.is_in_group("caneca_organica") and is_in_group("organicos"):
		Global.puntos += 1
		print("una basura entro en: organicos")
		print(Global.puntos)
		queue_free()
	if area.is_in_group("caneca_no_aprovechable") and is_in_group("no aprovechable"):
		Global.puntos += 1
		print("una basura entro en: no aprovcechable")
		print("puntuacion actual: ", Global.puntos)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	Global.cantidad_basura_perdida += 1
	print("una basura salio de la pantalla: ", Global.cantidad_basura_perdida)
