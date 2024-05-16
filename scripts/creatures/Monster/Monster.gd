class_name Monster extends Creature

@export var isPassive: bool = true
@export var experienceGranted: int = 0

func _ready():
	print("MONSTER ADDED TO GROUP '", CREATURE_CONSTANTS.MONSTERS, "'", creatureName)
	add_to_group(CREATURE_CONSTANTS.MONSTERS)
