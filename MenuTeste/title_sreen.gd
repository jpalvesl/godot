extends Control

var scene_path_to_load

func _ready():
	$Menu/ColunaCentral/Botoes/Start.grab_focus()
	for button in $Menu/ColunaCentral/Botoes.get_children():
		button.connect("pressed", self, "on_Button_pressed", [button.scene_to_load])

func on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
