class_name Creature extends CreatureStateManager

@export var creatureName: String:
	set(newName):
		if is_inside_tree(): 
			creatureName = newName
			$AnimatedSprite2D/CreatureName.text = "[center]{creatureName}[center]".format({"creatureName": creatureName})
@export var maxHealth: int = 100
@export var currentHealth: int = maxHealth
@export var movementSpeed: float = 50
@export var attackSpeed: int = 1
@export var attackRange: int = 1
@export var chaseTarget: bool = false
@export var isAttackable: bool = false
