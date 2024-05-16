extends CharacterBody2D

var creature: Creature
var mainCardinalDirection = "south"
var sprite: AnimatedSprite2D

func _init(creature: Creature):
	self.creature = creature
	sprite = creature.get_node("AnimatedSprite2D")
	
func _physics_process(delta):
	doMoving()

func doMoving():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	creature.velocity = input_direction * creature.getAttribute(CREATURE_ATTRIBUTES.MOVEMENT_SPEED).currentValue
	if creature.velocity.x != 0 or creature.velocity.y != 0:
		var rotationData = Helpers.getSpriteRotationData(input_direction)
		print("rotation data: ", rotationData)
		mainCardinalDirection = rotationData.mainCardinalDirection
		creature.setState(creature.Action.WALKING, mainCardinalDirection)
		sprite.flip_h = rotationData.flip
		sprite.rotation_degrees = rotationData.rotateByDegrees
	else:
		creature.setState(creature.Action.IDLE, mainCardinalDirection)
	update_animation()
	creature.move_and_slide()

func update_animation():
	if sprite != null:
		var animationName = "{action}_{mainCardinalDirection}".format({
			"action": creature.currentAction,
			"mainCardinalDirection": mainCardinalDirection
		})
		print("action running: {action}_{mainCardinalDirection}".format({
			"action": creature.currentAction,
			"mainCardinalDirection": mainCardinalDirection
		}))
		sprite.play(animationName)
