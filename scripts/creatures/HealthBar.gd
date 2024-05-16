extends TextureProgressBar

func _on_player_health_changed(newHealth):
	self.value = newHealth
