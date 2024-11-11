extends RigidBody2D

var mouse = preload("res://Jugador/mouse.tscn")
@export var is_clicked = false
@export var on_basura = false

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_T:
			is_clicked = true
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and on_basura == true:
		is_clicked = true
		print("You clicked on Sprite!")

func when_basura_clicked():
	if is_clicked == true:
		constant_force.x = 0
		linear_velocity.x = 0
		is_clicked = false
		#position = get_global_mouse_position()
		# prueba

func _physics_process(delta):
	when_basura_clicked()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("aprovechable"):
		Global.puntos += 1
		print("aprovcechable")
		print(Global.puntos)
		queue_free()
	if area.is_in_group("organicos"):
		Global.puntos += 1
		print("organicos")
		print(Global.puntos)
		queue_free()
	if area.is_in_group("no aprovechable"):
		Global.puntos += 1
		print("no aprovcechable")
		print(Global.puntos)
		queue_free()
	if area.is_in_group("mouse"):
		on_basura = true

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	print("una basura salio de la pantalla")
