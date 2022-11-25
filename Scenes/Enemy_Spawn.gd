extends Button

onready var _enemy = preload("res://Scenes/Enemy.tscn")

func _on_Button_pressed():
	var enemy = _enemy.instance()
	get_node("/root/Map/").add_child(enemy)
