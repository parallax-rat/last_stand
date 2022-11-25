extends Area2D

export var damage = 1
export var speed = 600
var direction = Vector2()

func shoot(aim_position, cannon_position):
	global_position = cannon_position
	direction = (aim_position - cannon_position).normalized()
	rotation = direction.angle()

func _process(delta):
	position += direction * speed * delta


func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	queue_free()
	print(self, " exited viewport; removing from tree.")


func _on_AutoCannonBullet_area_entered(area):
	area._damaged(damage)
	print("Damaged ", area, " for ", damage)
	queue_free()
