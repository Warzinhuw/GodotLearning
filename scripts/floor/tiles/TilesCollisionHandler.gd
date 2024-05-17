class_name TilesCollisionHandler extends Area2D

signal tileChanged

@export var creature: Creature
var currentTilemap: TileMap
var currentTileData: TileData

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is TileMap:
		processTileMapCollision(body, body_rid)
		tileChanged.emit()

func processTileMapCollision(body, body_rid: RID):
	currentTilemap = body
	
	var tileCoords = currentTilemap.get_coords_for_body_rid(body_rid)
	for index in currentTilemap.get_layers_count():
		var tileData = currentTilemap.get_cell_tile_data(index, tileCoords)
		if tileData is TileData:
			currentTileData = tileData
			dealWithSignalEmittion(index, getTileDataProperty(currentTileData, index))

func dealWithSignalEmittion(propertyId, propertyValue):
	TILES_SIGNALS_CONSTANS.TilesCallback[propertyId].callback(creature, propertyValue)

func getTileDataProperty(tileData : TileData, propertyID: int):
	return tileData["custom_data_{property}".format({
		"property" : propertyID
	})]
