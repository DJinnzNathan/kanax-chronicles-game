extends Area2D

var battle = preload("res://BattleScene/battle.tscn")



func _on_body_entered(body):
	if "Player" in body.name:
		$"../UI/AnimationPlayer".play("TransIn")
		$"../Player".playIdle()
		get_tree().paused = true
		await get_tree().create_timer(1.5).timeout 
		var battleTemp = battle.instantiate()
		get_parent().add_child(battleTemp)
		queue_free()
		$"../UI/AnimationPlayer".play("TransOut")
