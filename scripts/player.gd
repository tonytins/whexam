extends KinematicBody

const MOVE_SPEED = 4
const MOUSE_SENS = 0.5
const LEVEL_CAP = 10
const MAX_XP = 100

var level = 1
var prev_level = 1
var xp = 1

# Infrastructure
onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast

# Player Status
onready var health_stat = $CanvasLayer/Control/StatCtr/HealthCtr/HealthStat
onready var armor_stat = $CanvasLayer/Control/StatCtr/ArmorCtr/ArmorStat
onready var influence_stat = $CanvasLayer/Control/StatCtr/Influence/InfStat
onready var level_stat = $CanvasLayer/Control/StatCtr/Level/LevelStat
onready var xp_stat = $CanvasLayer/Control/StatCtr/XP/XPStat

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x

func _process(delta):
	influence_stat.text = str(Economy.influence)
	xp_stat.text = str(Economy.experience)
	
	if xp >= MAX_XP:
		prev_level = level
		level += 2
		
	if level > prev_level:
		Economy.max_inf * 1000
	
	if Input.is_action_pressed("exit"):
		get_tree().quit()
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
	# If armor is zero, lose health faster.
	# Otherwise, armor depletes health at a lower rate.
	match armor_stat.value:
		0:
			if health_stat.value == 0:
				get_tree().reload_current_scene()
			else:
				health_stat.value -= 0.5
		_:
			health_stat.value -= 0.1
			armor_stat.value -= 0.5
