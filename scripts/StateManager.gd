extends Node2D

# Define states
enum Action { idle, walk, run, attack }

var currentAction = Action.idle
var mainCardinalDirection = ""

func _process(delta):
	update_animation()

func update_animation():
	var animationName = "{action}_{mainCardinalDirection}".format({
		"action": currentAction,
		"mainCardinalDirection": mainCardinalDirection
	})
	
	$Sprite.play(animationName)

# Example usage
func set_state(action: Action, direction: String):
	currentAction = action
	mainCardinalDirection = direction
