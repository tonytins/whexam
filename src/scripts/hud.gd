extends Control

const DATA_DIR = "res://data/"
const TUNING_FILE = "tuning.json"

onready var health_stat = $StatPanel/Health/HealthStat
onready var armor_stat = $StatPanel/Armor/ArmorStat
onready var influence_stat = $StatPanel/Inf/InfStat
onready var level_stat = $StatPanel/Level/LevelStat
onready var xp_stat = $StatPanel/XP/XPStat
onready var message_txt = $MessageTxt

func _process(_delta):
	var limits = JsonHelper.key_value(DATA_DIR, TUNING_FILE, "limits")
	var levels = JsonHelper.key_value(DATA_DIR, TUNING_FILE, "levels")
	
	if PlayerStat.level <= limits["level_cap"]:
		if PlayerStat.experience >= levels[str(PlayerStat.level + 1)]["required_xp"]:
			PlayerStat.prev_level = PlayerStat.level
			PlayerStat.level += 1
			PlayerStat.influence += levels[str(PlayerStat.level)]["bonus_inf"]
			message_txt.text = "Required XP: " + str(levels[str(PlayerStat.level + 1)]["required_xp"]);
		else:
			message_txt.text = "Required XP: " + str(levels[str(PlayerStat.level + 1)]["required_xp"]);
		
	influence_stat.text = str(PlayerStat.influence)
	xp_stat.text = str(PlayerStat.experience)
	level_stat.text = str(PlayerStat.level)
