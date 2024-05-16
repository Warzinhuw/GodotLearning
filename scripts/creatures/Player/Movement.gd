extends CharacterBody2D

@export var rotationSpeed = 90.0
@onready var player: Player = get_parent()
var mainCardinalDirection = "south"

func _physics_process(delta):
		doMoving()

func doMoving():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	#print("input direction: {input_direction}, movementSpeed: {movementSpeed}".format({
		#"input_direction": input_direction,
		#"movementSpeed": player.movementSpeed
	#}))
	player.velocity = input_direction * player.movementSpeed
	if player.velocity.x != 0 or player.velocity.y != 0:
		var rotationData = Helpers.getSpriteRotationData(input_direction)
		mainCardinalDirection = rotationData.mainCardinalDirection
		player.setState(player.Action.WALKING, mainCardinalDirection)
		player.sprite.flip_h = rotationData.flip
		player.sprite.rotation_degrees = rotationData.rotateByDegrees
	else:
		player.setState(player.Action.IDLE, mainCardinalDirection)
	player.move_and_slide()
