extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Status.text = "Loading Save Data..."
	SaveManager.load_data()
	await get_tree().create_timer(0.2).timeout
	$Status.text = "Loading Textures"
	await get_tree().create_timer(0.6).timeout
	$Status.text = "Loading Sounds..."
	await get_tree().create_timer(0.6).timeout
	$Status.text = "Loading Fonts..."
	await get_tree().create_timer(0.2).timeout
	$Status.text = "Loading Scene..."
	await get_tree().create_timer(0.6).timeout
	$Status.text = "Loading Complete..."
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/Reactor.tscn")
