extends Node

@onready var player = $AudioStreamPlayer

var allowed_scenes = [
	"MainMenu",
	"Settings"
]

func _process(delta):
	var scene = get_tree().current_scene
	
	if scene == null:
		return
	
	var scene_name = scene.name
	
	if scene_name in allowed_scenes:
		if !player.playing:
			player.play()
	else:
		if player.playing:
			player.stop()
