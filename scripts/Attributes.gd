class_name Attribute extends Node

signal valueChanged(old, new)
signal maxValueChanged(old, new)

var Name = ""
var iconPath = ""
var currentValue = 0
var maxValue = 0

func setCurrentValue(newValue):
	var oldValue = currentValue
	currentValue = newValue
	valueChanged.emit(oldValue, currentValue)
	
func setMaxValue(newValue):
	var oldValue = maxValue
	maxValue = newValue
	maxValueChanged.emit(oldValue, maxValue)
