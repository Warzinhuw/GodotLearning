extends Node2D

class_name CreatureStateManager

class Action:
	const WALKING = "walk"
	const IDLE = "idle"
	const RUNNING = "run"
	const ATTACKING = "attack"

var currentAction = Action.IDLE
var mainCardinalDirection = ""
var creature: CharacterBody2D
var currentSprite: AnimatedSprite2D

func _ready():
	creature = $CharacterBody2D

func _process(_delta):
	update_animation()

func update_animation():
	if currentSprite != null:
		var animationName = "{action}_{mainCardinalDirection}".format({
			"action": currentAction,
			"mainCardinalDirection": mainCardinalDirection
		})
		currentSprite.play(animationName)

func setState(action: String, direction: String):
	currentAction = action
	mainCardinalDirection = direction

func setSprite(sprite: AnimatedSprite2D):
	currentSprite = sprite
	
func getSprite() -> AnimatedSprite2D:
	return currentSprite
