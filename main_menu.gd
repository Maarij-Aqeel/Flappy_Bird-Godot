extends Control
var scroll=0
const scroll_spd=4
var screen_size


func _ready() -> void:
	screen_size=get_window().size
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll+=scroll_spd
	if scroll>=screen_size.x-800:
		scroll=0
	$ground.position.x=-scroll


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Main.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
