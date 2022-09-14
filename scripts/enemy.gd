extends KinematicBody

const MOVE_SPEED = 2
const DATA_DIR = "res://data/"
const TUNING_FILE = "tuning.json"

onready var raycast = $RayCast
onready var anim_player = $AnimationPlayer

var player = null
var dead = false

func _ready():
	anim_player.play("walk")
	add_to_group("zombies")

func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	
	var vec_to_player = player.translation - translation
	vec_to_player = vec_to_player.normalized()
	raycast.cast_to = vec_to_player * 1.5
	
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll != null and coll.name == "Player":
			coll.kill()
			
func kill():
	var balance = Jsonhelper.key_value(DATA_DIR, TUNING_FILE, "balance")
	var drop_rates = Jsonhelper.key_value(DATA_DIR, TUNING_FILE, "enemies")["thugs_easy"]
	
	if PlayerStat.influence < balance["max_inf"]:
		PlayerStat.influence += drop_rates["inf_drop"]
	
	if PlayerStat.experience < balance["max_xp"]:
		PlayerStat.experience += drop_rates["xp_drop"]
		
	dead = true
	$CollisionShape.disabled = true
	anim_player.play("die")

func set_player(p):
	player = p
