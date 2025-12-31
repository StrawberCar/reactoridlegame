extends Control

@onready var newgame = 0
@onready var bypass: bool

#func _ready() -> void:
	#if SaveManager.data.NewGame == true:
		#bypass = false
	#else: 
		#bypass == true

func _on_play_pressed() -> void:
	$Click.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://Scenes/LoadingData.tscn")


func _on_play_mouse_entered() -> void:
	$Hover.play()
