extends Node2D

@export var creature: Creature
var mainCardinalDirection = "south"

func _physics_process(delta):
	doMoving()

func doMoving():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	creature.velocity = input_direction * creature.getAttribute(CREATURE_ATTRIBUTES.MOVEMENT_SPEED).currentValue
	if creature.velocity.x != 0 or creature.velocity.y != 0:
		creature.rotationData = Helpers.getSpriteRotationData(input_direction)
		mainCardinalDirection = creature.rotationData["mainCardinalDirection"]
		creature.setState(creature.Action.WALKING, mainCardinalDirection)
	else:
		creature.setState(creature.Action.IDLE, mainCardinalDirection)
	creature.move_and_slide()


