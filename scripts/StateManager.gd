extends Node2D

class Action:
	const WALKING = "walk"
	const IDLE = "idle"
	const RUNNING = "run"
	const ATTACKING = "attack"

var currentAction = Action.IDLE
var mainCardinalDirection = ""
@onready var sprite : AnimatedSprite2D = get_node("/root/Floors/StateManager/Player/AnimatedSprite2D")

func _process(delta):
	update_animation()

func update_animation():
	var animationName = "{action}_{mainCardinalDirection}".format({
		"action": currentAction,
		"mainCardinalDirection": mainCardinalDirection
	})
	print("playing {action}_{mainCardinalDirection} animation".format({
		"action": currentAction,
		"mainCardinalDirection": mainCardinalDirection
	}))
	sprite.play(animationName)

func set_state(action: String, direction: String):
	currentAction = action
	mainCardinalDirection = direction
