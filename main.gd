extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ScaleScroller/MultiplierText.text = tr("SCALINGFACTOR") + ": " + str(int(Global.scale_multiplier * 100) * 0.01) + "x"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_v_scroll_bar_value_changed(value: float) -> void:
	Global.scale_multiplier =  1.0 - value * 0.01
	$ScaleScroller/MultiplierText.text = tr("SCALINGFACTOR") + ": " + str(int(Global.scale_multiplier * 100) * 0.01) + "x"
