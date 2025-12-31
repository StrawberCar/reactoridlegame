extends RigidBody2D

@onready var graceperiod = false

func _ready() -> void:
	await get_tree().create_timer(0.3).timeout
	graceperiod = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("FuelCell1") and graceperiod == true:
		$Sprite2D.hide()
		$Particles.emitting = true
		SaveManager.data.Money += 1
		SaveManager.save_data()
		$FuelHit.play()
		await get_tree().create_timer(0.1).timeout
		Globals.currentcapacity -= 1
		queue_free()
