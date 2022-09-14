extends Control

const DATA_DIR = "res://data/"
const TUNING_FILE = "tuning.json"

onready var health_stat = $StatPanel/Health/HealthStat
onready var armor_stat = $StatPanel/Armor/ArmorStat
onready var influence_stat = $StatPanel/Inf/InfStat
onready var level_stat = $StatPanel/Level/LevelStat
onready var xp_stat = $StatPanel/XP/XPStat
onready var message_txt = $MessageTxt

func _process(delta):
	var balance = Jsonhelper.key_value(DATA_DIR, TUNING_FILE, "balance")
	
	if PlayerStat.experience > balance["max_xp"]:
		PlayerStat.prev_level = PlayerStat.level
		PlayerStat.experience = 0
		PlayerStat.level += 1
		
	influence_stat.text = str(PlayerStat.influence)
	xp_stat.text = str(PlayerStat.experience)
	level_stat.text = str(PlayerStat.level)
