class_name CreatureStateManager extends CharacterBody2D

class Action:
	const WALKING = "walk"
	const IDLE = "idle"
	const RUNNING = "run"
	const ATTACKING = "attack"

var currentAction = Action.IDLE
var mainCardinalDirection = ""

func setState(action: String, direction: String):
	currentAction = action
	mainCardinalDirection = direction
