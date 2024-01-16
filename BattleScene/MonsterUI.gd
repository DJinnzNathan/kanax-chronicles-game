extends Control

var maxHealth
func _ready():
	await get_tree().create_timer(0.5).timeout
	maxHealth = $"../Enemy2".get_child(0).Health
	$HPBar.max_value = $"../Enemy2".get_child(0).Health
	$HPBar.value = $"../Enemy2".get_child(0).Health
	

func _process(delta):
	$HPBar.value = $"../Enemy2".get_child(0).Health
	$HPTxt.text = str($"../Enemy2".get_child(0).Health) + " / " + str(maxHealth)
	$Info.text = "Monster " + str($"../Enemy2".get_child(0).name) + " LVL " + str($"../Enemy2".get_child(0).Level)
