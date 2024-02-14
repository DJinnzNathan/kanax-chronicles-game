extends StaticBody2D

var Health = 91
var Level = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	Level = randi_range(1,5)
	spawn()
	$aim/attack.hide()

func hit(anim, damage):
	Health -= damage
	$aim/attack.show()
	$aim/attack.play(anim)


func spawn():
	$AnimationPlayer.play("Spawn", -1, 2)

func _on_attack_animation_finished():
	$aim/attack.hide()
	
	
func capture():
	$AnimationPlayer.play("Capture", -1, 3)
	await $AnimationPlayer.animation_finished
	get_parent().get_parent()._on_flee_pressed()

func generate_random_health():
	Health = randi_range(50, 99)
	pass
