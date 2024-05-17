class_name TILES_SIGNALS_CONSTANS extends Node2D

enum TileProperty {
	SLOW_CREATURE = 0
}

static var TilesCallback = {
	TileProperty.SLOW_CREATURE: slowCreatureTile.new()
}

class slowCreatureTile:
	func callback(creature: Creature, slowPercent: float):
		if(slowPercent == 0):
			if(creature.isSlowed()):
				creature.removeCondition(CREATURE_CONDITIONS.LIST.SLOW)
			return
		var slow = SlowCondition.new(creature, slowPercent, GLOBAL_CONSTANTS.DURATION_INFINITE)
		creature.addCondition(slow)
		creature.addConditionToPanel(slow)
