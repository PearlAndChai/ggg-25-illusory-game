extends TextureButton

func _ready():
	if texture_normal:
		# Get the image from the texture normal
		var image = texture_normal.get_image()
		# Create the BitMap
		var bitmap = BitMap.new()
		# Fill it from the image alpha
		bitmap.create_from_image_alpha(image)
		# Assign it to the mask
		texture_click_mask = bitmap

func _on_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/normal_world/normalworld.tscn") # Replace with function body.
