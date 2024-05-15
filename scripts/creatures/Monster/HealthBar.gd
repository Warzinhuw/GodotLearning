extends TextureProgressBar

@onready var monster: Monster = get_node("Monster")
@onready var progressBar: TextureProgressBar = $TextureProgressBar

func _ready():
	progressBar.max_value = monster.maxHealth


func _on_character_body_2d_health_changed(newHealth):
	progressBar.value = newHealth
