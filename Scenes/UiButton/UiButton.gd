extends TextureButton

class_name UiButton

@export var text: String = "Set me"

@onready var label: Label = $Label

func _ready() -> void:
	label.text = text