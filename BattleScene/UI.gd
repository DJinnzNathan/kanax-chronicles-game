extends Control



func _on_fight_pressed():
	$Menu.hide()
	$"Fight/GridContainer/Attack 1".grab_focus()
	$Fight.show()


func _on_back_pressed():
	$Menu.show()
	$Menu/GridContainer/Fight.grab_focus()
	$Switch.hide()
	$Fight.hide()
	
func _process(_delta):
	$HPBar.value = Game.SelectedMonsters[get_parent().selected]["Health"]
	$Info.text = str(Game.SelectedMonsters[get_parent().selected]["Name"])+"LVL" + str(Game.SelectedMonsters[get_parent().selected]["Level"])
	$HPTxt.text = str(Game.SelectedMonsters[get_parent().selected]["Health"])
	#SET ATTACK NAMES
	for i in Game.SelectedMonsters[get_parent().selected]["Attacks"]:
		var path = "Fight/GridContainer/Attack " + str(((i)+1))
		get_node(path).text = Game.SelectedMonsters[get_parent().selected]["Attacks"][i]["Name"]


func _on_switch_pressed():
	$Menu.hide()
	$"Switch/GridContainer/Monster 1".grab_focus()
	$Switch.show()
	$Fight.hide()


func _on_flee_pressed():
	$"../../UI/Anim".play("Transition")
	await get_tree().create_timer(1.5).timeout
	get_parent().queue_free()
	get_tree().paused = false 


func _on_attack_pressed(extra_arg_0):
	if Game.SelectedMonsters[get_parent().selected]["Attacks"][extra_arg_0]["Target"] == "Monster":
		var tempDic = Game.SelectedMonsters[get_parent().selected]["Attacks"]
		$"../Enemy2".get_child(0).hit(tempDic[extra_arg_0]["Name"], tempDic[extra_arg_0]["Damage"])
		$"../Action".text = "Your " + str(Game.SelectedMonsters[get_parent().selected]["Name"]) + " Has attacked for " + str(tempDic[0]["Damage"]) + " hp"
		get_parent().MonsterTurn()
