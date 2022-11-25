extends Area2D

var mouse_pos
var L_firing = false
var R_firing = false
var L_cooldown = false
var R_cooldown = false
export var health = 10
export var bullet_damage = 1
export var bullet_speed = 200
export var shot_cooldown = 0.3

onready var left_barrel = $Body/AutoCannon/Left_Barrel
onready var right_barrel = $Body/AutoCannon/Right_Barrel
onready var L_timer = $Body/AutoCannon/Left_Barrel/Timer
onready var R_timer = $Body/AutoCannon/Right_Barrel/Timer
onready var anim = $Body/AutoCannon/AnimationPlayer
onready var BULLET = preload("res://Scenes/AutoCannonBullet.tscn")

func _physics_process(_delta):
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	check_fire()

func damage(dmg):
	health -= dmg
	print("Player took ", dmg, " damage.")

func check_fire():
	if Input.is_action_pressed("fire_left"):
		if L_cooldown == false:
			anim.play("L_Shoot")
			#fire(left_barrel)
			#L_cooldown = true
			#L_timer.start(shot_cooldown)
			#print("Fire left")
			
	if Input.is_action_pressed("fire_right"):
		if R_cooldown == false:
			pass

#func fire(barrel):
	#print(barrel)
	#var bullet = BULLET.instance()
	#get_node("/root/Map/").add_child(bullet)
	#bullet.shoot(get_global_mouse_position(), barrel.global_position)

func _primary_fire_L():
	var bullet = BULLET.instance()
	get_node("/root/Map/").add_child(bullet)
	bullet.shoot(get_global_mouse_position(), left_barrel.global_position)
	
func _primary_fire_R():
	var bullet = BULLET.instance()
	get_node("/root/Map/").add_child(bullet)
	bullet.shoot(get_global_mouse_position(), right_barrel.global_position)

func _L_cooldown():
		#L_cooldown = false
		#L_timer.stop()
		print("Left cooled down")

func _R_cooldown():
		#R_cooldown = false
		#R_timer.stop()
		print("Right cooled down")
