extends CharacterBody2D
const Helpers = preload("res://scripts/Helpers.gd")

@onready var MonsterSettings: Monster = get_parent()
@onready var creatureStateManager: CreatureStateManager = get_node("/CreatureStateManager")
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var monsterInRange: bool = false
var player: Player = null

func _physics_process(_delta):
	if monsterInRange and MonsterSettings.chaseTarget:
		var direction = (player.global_position  - global_position).normalized()
		velocity = direction * MonsterSettings.movementSpeed
		if velocity.x != 0 or velocity.y != 0:
			var rotationData = Helpers.getSpriteRotationData(direction)
			var mainCardinalDirection = rotationData.mainCardinalDirection
			creatureStateManager.setState(creatureStateManager.Action.WALKING, mainCardinalDirection)
			sprite.flip_h = rotationData.flip
			sprite.rotation_degrees = rotationData.rotateByDegrees
			move_and_slide()
	else:
		creatureStateManager.setState(creatureStateManager.Action.IDLE, "south")

func _on_detection_area_body_entered(body):
	player = body
	monsterInRange = true

func _on_detection_area_body_exited(_body):
	player = null
	monsterInRange = false
