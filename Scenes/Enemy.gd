extends Area2D

export var health = 1
export var speed = 160
export var damage = 1
export var spawn_distance = 720
export var spawn_spacing_minimum = 40
var direction
var rng = RandomNumberGenerator.new()
var random_spawn = [Vector2(spawn_distance,0), Vector2(-spawn_distance, 0), Vector2(0, spawn_distance), Vector2(0, -spawn_distance), Vector2(spawn_distance, spawn_distance), Vector2(spawn_distance, -spawn_distance), Vector2(-spawn_distance, -spawn_distance), Vector2(-spawn_distance, spawn_distance)]
onready var player = get_node("/root/Map/Player")

func _ready():
	rng.randomize()
	var spawn_loc = rng.randi_range(0,7)
	var rand1 = rng.randi_range(spawn_spacing_minimum, spawn_distance / 2)
	var rand2 = rng.randi_range(spawn_spacing_minimum, spawn_distance / 2)
	var spawn_offset = Vector2(rand1, rand2)
	global_position = random_spawn[spawn_loc] + spawn_offset
	print(self, " spawned @ ", global_position)
	direction = (player.global_position - global_position).normalized()
	rotation = direction.angle()

func _physics_process(delta):
	position += direction * speed * delta
	
func _damaged(dmg):
	health -= dmg
	if health <= 0:
		print(self, ": I am dead.")
		queue_free()

func _on_Enemy_area_entered(area):
	if area == player:
		player.damage(damage)
		queue_free()
