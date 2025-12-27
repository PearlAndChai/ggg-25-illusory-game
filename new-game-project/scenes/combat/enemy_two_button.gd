extends TextureButton

const ENEMY_1_IDLE = [
	preload("uid://ratynadr5m3w"),
	preload("uid://dnul2xvqbs30b"),
	preload("uid://c0mv48ux3u35t"),
	preload("uid://ojojhj8ceh2l"),
	preload("uid://bks4ge0obyv4y")
	
]

var frame = 0
const FRAME_LENGTH = 0.125
var time = 0

func _process(_delta):
	if global_variables.current_enemy_number  == 2:
		if time > FRAME_LENGTH:
			time = 0
			frame += 1
			if frame > 4:
				frame = 0
			texture_normal = ENEMY_1_IDLE[frame]
			set_bitmap()
		else:
			time += 0.005
			
func set_bitmap():
	if texture_normal:
		# Get the image from the texture normal
		var image = texture_normal.get_image()
		# Create the BitMap
		var bitmap = BitMap.new()
		# Fill it from the image alpha
		bitmap.create_from_image_alpha(image)
		# Assign it to the mask
		texture_click_mask = bitmap
