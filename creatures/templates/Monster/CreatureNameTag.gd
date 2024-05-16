@tool extends RichTextLabel

func _on_name_name_changed(old, new):
	print("Creature name changed from {oldName} to {newName}".format({
		"oldName": old,
		"newName": new
		}))
	self.text = "[center]{newName}[center]".format({
		"newName": new
	})
