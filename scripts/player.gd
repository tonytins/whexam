extends KinematicBody

const MOVE_SPEED = 4
const MOUSE_SENS = 0.5
const DATA_DIR = "res://data/"
const TUNING_FILE = "tuning.json"

var is_paused = true

# Infrastructure
onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast
onready var hud = $CanvasLayer/Control/HUD
onready var pause_screen = $CanvasLayer/Control/Pause

func _ready():
	pause_screen.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x

func _process(delta):
	
	if Input.is_action_just_pressed("exit"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		hud.hide()
		pause_screen.show()
	
	if Input.is_action_pressed("restart"):
		kill()

func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forwards"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backwards"):
		move_vec.z += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
		
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_collide(move_vec * MOVE_SPEED * delta)
	
	if Input.is_action_pressed("shoot") and !anim_player.is_playing():
		anim_player.play("shoot")
		var coll = raycast.get_collider()
		if raycast.is_colliding() and coll.has_method("kill"):
			coll.kill()

func kill():
	get_tree().reload_current_scene()
	
func _on_ResumeBtn_pressed():
	pause_screen.hide()
	hud.show()
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_ExitBtn_pressed():
	get_tree().quit()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_RestartBtn_pressed():
	pause_screen.hide()
	PlayerStat.debug_reset()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().reload_current_scene()

func _on_PlayerWindow_hide():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
