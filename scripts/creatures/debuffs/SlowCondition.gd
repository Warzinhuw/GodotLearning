class_name SlowCondition extends CreatureCondition

@export var slowPercent: float
var creature: Creature
var reducedMoveSpeed

func _init(creatureSlowed: Creature, slowPercent: float, duration: int):
	self.creature = creatureSlowed
	self.conditionName = CREATURE_CONDITIONS.LIST.SLOW
	self.slowPercent = slowPercent
	self.connect("tree_exiting", _on_debuff_removed())
	reduceCreatureSpeed(creature, slowPercent)
	#TODO add timer self.duration.start(duration)

func isSlowed(creature: Creature):
	return self.isConditionActive(creature, CREATURE_CONDITIONS.LIST.SLOW)
	
func reduceCreatureSpeed(creature: Creature, slowPercent: float):
	var oldMoveSpeed = creature.getCurrentAttributeValue(CREATURE_ATTRIBUTES.MOVEMENT_SPEED)
	reducedMoveSpeed = oldMoveSpeed - (oldMoveSpeed*slowPercent/100)
	creature.setCurrentAttributeValue(CREATURE_ATTRIBUTES.MOVEMENT_SPEED, reducedMoveSpeed)

func _on_debuff_removed():
	if !creature:
		return
	print("SLOW REMOVED")
	var currentSpeed = creature.getCurrentAttributeValue(CREATURE_ATTRIBUTES.MOVEMENT_SPEED)
	creature.setCurrentAttributeValue(CREATURE_ATTRIBUTES.MOVEMENT_SPEED, currentSpeed + reducedMoveSpeed)
