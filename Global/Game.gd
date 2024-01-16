extends Node


func _ready():
	print(SelectedMonsters)
	addMonster("kek")
	print(SelectedMonsters)
	addMonster("hund")
	
var dataBaseKanaxChronicles = {
		0 : {
	"Name" : "kek",
	"Health": 100,
	"Level" : 15,
	"MaxExp" : 10,
	"Defense"  : 5,
	"Strength" : 10,
	"Scene" : preload("res://BattleScene/battle.tscn"),
	"Attacks" : {
		0 : {
				"Name" : "TRETEN",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			1 : {
				"Name" : "ANSPUCKEN",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
				},
				2 : {
					"Name" : "BELEIDIGEN",
					"Target" : "Monster",
					"Damage" : 10,
					"cost" : 2
				}
			}
		},
		1 : {
	"Name" : "hund",
	"Health": 100,
	"Level" : 15,
	"MaxExp" : 10,
	"Defense"  : 5,
	"Strength" : 10,
	"Scene" : preload("res://BattleScene/battle.tscn"),
	"Attacks" : {
		0 : {
				"Name" : "TRETEN",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
			},
			1 : {
				"Name" : "ANSPUCKEN",
				"Target" : "Monster",
				"Damage" : 10,
				"cost" : 2
				},
				2 : {
					"Name" : "BELEIDIGEN",
					"Target" : "Monster",
					"Damage" : 10,
					"cost" : 2
				}
			}
		},
	}
	
var SelectedMonsters = {
	
}
	
func addMonster(Name):
	for i in dataBaseKanaxChronicles:
		if dataBaseKanaxChronicles[i]["Name"] == Name :
			var tempDic = dataBaseKanaxChronicles[i].duplicate(true)
			SelectedMonsters[SelectedMonsters.size()] = tempDic

func EXP(amount):
	for i in SelectedMonsters:
		SelectedMonsters[i]["Exp"] += amount
		if SelectedMonsters[i]["Exp"] >= SelectedMonsters[i]["MaxExp"]:
			#LEVEL UP!
			SelectedMonsters[i]["Level"] += 1
			SelectedMonsters[i]["Exp"] = 0
			SelectedMonsters[i]["MaxExp"] = SelectedMonsters[i]["MaxExp"]*1.5
		
