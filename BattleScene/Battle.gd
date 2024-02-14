extends CanvasLayer

var kek = preload("res://Monsters/kek.tscn")
var hund = preload("res://Monsters/hund.tscn")
var selected = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var montemp = kek.instantiate()
	$Enemy2.add_child(montemp)
	var montep2 = hund.instantiate()
	$Player.add_child(montep2)
	$UI/Menu.hide()
	$UI/Switch.hide()
	$UI/Fight.hide()
	$UI/Menu/GridContainer/Fight.grab_focus()
	
	await get_tree().create_timer(2).timeout
	
	for i in Game.SelectedMonsters:
		var monTemp = Game.SelectedMonsters[i]["Scene"].instantiate()
		monTemp.name = Game.SelectedMonsters[i]["Name"]
		monTemp.hide()
		#BUG adds instances of monster to player
		#$Player.add_child(monTemp)
		#$Player.get_child(0).show()
		$UI/Menu.show()
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_capture_pressed():
	$"Action".text = "You can't capture... just fight, man!"
	pass # Replace with function body.
	
func MonsterTurn():
	$UI/Menu.hide()
	$UI/Switch.hide()
	$UI/Fight.hide()
	
	var damage = randi_range(10,15)
	$Action.text = "Enemy is thinking ..."
	await get_tree().create_timer(1).timeout
	
	if $Enemy2.get_child(0).Health <= 0:
		Game.addEXP(10)
		get_tree().paused = false
		queue_free()
	$Player.get_child(selected).hit("ANSPUCKEN", damage)
	$Action.text = "Enemy " + $Enemy2.get_child(0).name + " Has attacked using ANSPUCKEN for " + str(damage) + " hp"
	Game.SelectedMonsters[0]["Health"] -= damage
	await get_tree().create_timer(1).timeout
	$UI/Menu/GridContainer/Fight.grab_focus()
	$UI/Menu.show()
	
	
