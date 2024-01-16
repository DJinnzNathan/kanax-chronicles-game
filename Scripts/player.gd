extends CharacterBody2D

@export var speed = 150
var look_dir = "down"

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_pressed("ui_right"):
		look_dir = "right"
		$Sprite2D/AnimationPlayer.play("walk_right")
		velocity = Vector2(1, 0) * speed
	elif Input.is_action_pressed("ui_left"):
		look_dir = "left"
		$Sprite2D/AnimationPlayer.play("walk_left")
		velocity = Vector2(-1, 0) * speed
	elif Input.is_action_pressed("ui_up"):
		look_dir = "up"
		$Sprite2D/AnimationPlayer.play("walk_up")
		velocity = Vector2(0, -1) * speed
	elif Input.is_action_pressed("ui_down"):
		look_dir = "down"
		$Sprite2D/AnimationPlayer.play("walk_down")
		velocity = Vector2(0, 1) * speed
	else:	
		$Sprite2D/AnimationPlayer.play("idle_" + look_dir)
		velocity = Vector2(0, 0)

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func playIdle():
	$Sprite2D/AnimationPlayer.play("idle_" + look_dir)

func _on_battle_spawn_body_entered(body):
	pass # Replace with function body.
