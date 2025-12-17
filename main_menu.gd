extends Control




func _on_play_pressed() -> void:
	$Click.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://LoadingData.tscn")
