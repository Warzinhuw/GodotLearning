extends Node

var conditionHandlers = {
	CREATURE_CONDITIONS.LIST.SLOW: slowConditionHandler.new()
}

#Generic condition change, it just pass foward to the correct condition type
func _on_monster_condition_changed(creature: Creature, condition: CreatureCondition):
	if !condition.conditionName in conditionHandlers:
		print("Condition Handler for condition {0} was not found".format(condition.conditionName))
		return
	conditionHandlers[condition.conditionName].callback(creature, condition)

class slowConditionHandler:
	func callback(creature: Creature, condition: SlowCondition):
		var oldMoveSpeed = creature.getAttribute(CREATURE_ATTRIBUTES.MOVEMENT_SPEED).maxValue
		var reducedMoveSpeed = oldMoveSpeed - (oldMoveSpeed*condition.slowPercent/100)
		creature.getAttribute(CREATURE_ATTRIBUTES.MOVEMENT_SPEED).setCurrentValue(reducedMoveSpeed)
		print("MOVESPEED CHANGED FROM {0}, to {1}".format([oldMoveSpeed, reducedMoveSpeed]))
