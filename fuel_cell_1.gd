extends RigidBody2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("FuelCell1"):
		$Sprite2D.hide()
		$Particles.emitting = true
		Globals.money += 1
		$FuelHit.play()
		await get_tree().create_timer(0.5).timeout
		queue_free()
