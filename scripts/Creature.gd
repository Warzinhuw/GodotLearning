class_name Creature extends CreatureStateManager

signal healthChanged(newHealth: int)


@export var creatureName: String:
	set(newName):
			if is_inside_tree():
				creatureName = newName
				$CreatureName.text = "[center]{creatureName}[center]".format({"creatureName": creatureName})
	get:
		return creatureName
@export var maxHealth: int = 100
@export var currentHealth: int = maxHealth
@export var movementSpeed: float = 50
@export var attackSpeed: float = 1
@export var attackRange: int = 1
@export var chaseTarget: bool = false
@export var isAttackable: bool = false
@export var attackAnimation: AnimationPlayer
@export var beingHitAnimation: AnimationPlayer

#combat settings
var basicAttackCooldown: Timer
var attackPower: int
var defensePower: int

func basicAttack(attacker: Creature, target: Creature):
	if basicAttackCooldown.time_left > 0:
		return
	if target.isAttackable:
		attacker.hitAnimation.play()
		target.takeDamage(attackPower)
		basicAttackCooldown.start((attackSpeed*60)/60)

func takeDamage(damage: int):
	currentHealth -= damage
	beingHitAnimation.play()
	healthChanged.emit(currentHealth)
