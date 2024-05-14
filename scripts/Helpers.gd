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
