extends Area2D

# Allows you to pick the next scene directly in the Inspector
@export_file("*.tscn") var next_scene_path: String

var player_in_zone: bool = false

func _process(_delta: float) -> void:
	# Check if the player is inside the zone AND presses the Up Arrow
	if player_in_zone and Input.is_action_just_pressed("ui_up"):
		if next_scene_path != "":
			get_tree().change_scene_to_file(next_scene_path)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_zone = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_zone = false
