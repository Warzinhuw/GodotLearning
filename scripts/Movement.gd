extends CharacterBody2D
const Helpers = preload("res://scripts/Helpers.gd")
const StateManager = preload("res://scripts/StateManager.gd")

signal hit

@export var speed = 400
@export var rotationSpeed = 90.0
@onready var sprite = $AnimatedSprite2D
@onready var stateManager : StateManager = get_node("/root/Floors/StateManager")
var mainCardinalDirection = "south"

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if velocity.x != 0 or velocity.y != 0:
		var rotationData = getSpriteRotationData(input_direction)
		mainCardinalDirection = rotationData.mainCardinalDirection
		stateManager.set_state(StateManager.Action.WALKING, mainCardinalDirection)
		sprite.flip_h = rotationData.flip
		sprite.rotation_degrees = rotationData.rotateByDegrees
	else:
		stateManager.set_state(StateManager.Action.IDLE, mainCardinalDirection)
	move_and_slide()
	
# Given a direction, returns a set of data that helps the sprite renderer decide which animation to use, and how to flip or rotate the sprite.
func getSpriteRotationData(targetDirection : Vector2):
	var flip = false
	var rotateByDegrees = 0
	var mainCardinalDirection = "undefined"

	var cardinalDirection = Helpers.getCardinalDirection(targetDirection)
	if cardinalDirection == "SOUTHEAST" or cardinalDirection == "EAST" or cardinalDirection == "WEST" or cardinalDirection == "NORTHWEST":
		flip = true
	
	if cardinalDirection == "WEST" or cardinalDirection == "NORTHWEST" or cardinalDirection == "NORTH" or cardinalDirection == "NORTHEAST":
		mainCardinalDirection = "north"
	else:
		mainCardinalDirection = "south"
		
	if cardinalDirection == "NORTH" or cardinalDirection == "SOUTH":
		rotateByDegrees = 0
	elif cardinalDirection == "NORTHWEST":
		rotateByDegrees = -73
	elif cardinalDirection == "EAST" or cardinalDirection == "WEST":
		rotateByDegrees = -90
	elif cardinalDirection == "NORTHEAST":
		rotateByDegrees = 12
	elif cardinalDirection == "SOUTHEAST":
		rotateByDegrees = -77
	elif cardinalDirection == "SOUTHWEST":
		rotateByDegrees = 10

	return {
		"flip" : flip, 
		"rotateByDegrees" : rotateByDegrees, 
		"mainCardinalDirection" : mainCardinalDirection
	}
