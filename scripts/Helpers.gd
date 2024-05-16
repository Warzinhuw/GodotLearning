extends Node2D

static func getCardinalDirection(targetDirection: Vector2) -> String:
	var direction = ""
	
	if targetDirection.x > 0:
		if targetDirection.y > 0:
			direction = "SOUTHEAST"
		elif targetDirection.y < 0:
			direction = "NORTHEAST"
		else:
			direction = "EAST"
	elif targetDirection.x < 0:
		if targetDirection.y > 0:
			direction = "SOUTHWEST"
		elif targetDirection.y < 0:
			direction = "NORTHWEST"
		else:
			direction = "WEST"
	else:
		if targetDirection.y > 0:
			direction = "SOUTH"
		elif targetDirection.y < 0:
			direction = "NORTH"
	
	return direction

# Given a direction, returns a set of data that helps the sprite renderer decide which animation to use, and how to flip or rotate the sprite.
static func getSpriteRotationData(targetDirection : Vector2):
	var flip = false
	var rotateByDegrees = 0
	var mainCardinalDirection = "undefined"

	var cardinalDirection = getCardinalDirection(targetDirection)
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
