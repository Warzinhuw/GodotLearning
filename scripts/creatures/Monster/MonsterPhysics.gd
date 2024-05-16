#@tool 
#extends Monster
#
#signal healthChanged(newHealth: int)
#@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
#var monsterInRange: bool = false
#var player: Player = null
	#
#func _physics_process(_delta):
	#if monsterInRange and self.chaseTarget:
		#dealWithMovement()
	#else:
		#self.setState(self.Action.IDLE, "south")
#
#func dealWithMovement():
	#var direction = (player.global_position - global_position).normalized()
	#velocity = direction * self.movementSpeed
	#if velocity.x != 0 or velocity.y != 0:
		#var rotationData = Helpers.getSpriteRotationData(direction)
		#var mainCardinalDirection = rotationData.mainCardinalDirection
		#self.setState(self.Action.WALKING, mainCardinalDirection)
		#sprite.flip_h = rotationData.flip
		#sprite.rotation_degrees = rotationData.rotateByDegrees
		#move_and_slide()
		#
#func takeDamage(damage: int):
	#currentHealth -= damage
	#healthChanged.emit(currentHealth)
#
#func _on_detection_area_body_entered(body):
	#player = body
	#monsterInRange = true
#
#func _on_detection_area_body_exited(_body):
	#player = null
	#monsterInRange = false
