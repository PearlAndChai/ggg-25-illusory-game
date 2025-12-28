extends TextureButton

const ENEMY_1_IDLE = [
	preload("uid://dfk8vbx3tn0xd"),
	preload("uid://dax580odx8jjf"),
	preload("uid://bn8wg2vmr3s4c"),
	preload("uid://b5fpnlsal4uyl"),
	preload("uid://qida25ivm5d8"),
	preload("uid://c0fgnt4kheyex"),
	preload("uid://ddpxqffr6no6y")
]

const ENEMY_1_IDLE_HIGHLIGHT = [
	preload("uid://bme6gytr6lb16"),
	preload("uid://dq2ak4468flb8"),
	preload("uid://dwtxvewcqo3k5"),
	preload("uid://bgdpb8bdn1wgm"),
	preload("uid://dhxrl3imxi3ai"),
	preload("uid://ba6vvrgl2ekav"),
	preload("uid://dcvkcd0ix5kpu")
	
]

const ENEMY_2_IDLE = [
	preload("uid://vgei5k0f2qx4"),
	preload("uid://c4lw3sf0w6i2n"),
	preload("uid://8kyt0wjg6qb5"),
	preload("uid://dkdtuiq561vef"),
	preload("uid://5tse8ggckfrw")
	
]

const ENEMY_2_IDLE_HIGHLIGHT = [
	preload("uid://b8i2vlhirnkrd"),
	preload("uid://bctk60dc8heww"),
	preload("uid://bbgqu4fsis1xy"),
	preload("uid://bin57ngjm2g2v"),
	preload("uid://ceorbxpiun0b4")
	
]

var frame = 0
const FRAME_LENGTH = 0.125
var time = 0

func _ready() -> void:
	set_bitmap()

func _process(delta):
	if global_variables.current_enemy_number  == 1:
		if time > FRAME_LENGTH:
			time = 0
			frame += 1
			if frame > 6:
				frame = 0
			texture_normal = ENEMY_1_IDLE[frame]
			texture_hover = ENEMY_1_IDLE_HIGHLIGHT[frame]
			set_bitmap()
		else:
			time += delta
	elif global_variables.current_enemy_number  == 2:
		if time > FRAME_LENGTH:
			time = 0
			frame += 1
			if frame > 4:
				frame = 0
			texture_normal = ENEMY_2_IDLE[frame]
			texture_hover = ENEMY_2_IDLE_HIGHLIGHT[frame]
			set_bitmap()
		else:
			time += delta / 2
				
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
