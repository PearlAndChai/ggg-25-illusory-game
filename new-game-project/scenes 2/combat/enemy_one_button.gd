extends TextureButton

const ENEMY_1_IDLE = [
	preload("uid://b4cjqcq0u8qqt"),
	preload("uid://crw6cavu2txt"),
	preload("uid://bvyk88h1vwc2m"),
	preload("uid://b0g7aaa6iam7j"),
	preload("uid://ccavg7chej5sf"),
	preload("uid://cc1skmpclgan6"),
	preload("uid://bcbffj5j77elr")
]

const ENEMY_1_IDLE_HIGHLIGHT = [
	preload("uid://c8w7nn12cec5e"),
	preload("uid://c7yrmbontgvkm"),
	preload("uid://d0vkc30xxtf4g"),
	preload("uid://bujnsww3p5ku6"),
	preload("uid://xsuhhl5665pk"),
	preload("uid://b53lp8y6t0mxi"),
	preload("uid://ikni4tc8tf15")
]

const ENEMY_1_ATTACK = [
	preload("uid://coqti7e2p06k0"),
	preload("uid://gpls7su8t5qe"),
	preload("uid://cvcvxxqpqdpfh"),
	preload("uid://cfyx2on1c6ehd"),
	preload("uid://bxyrdhc3eo4ec"),
	preload("uid://bb5xmuo4fbafc"),
	preload("uid://wc58x4v2l47n")
]

const ENEMY_2_IDLE = [
	preload("uid://cvt36s8qsv036"),
	preload("uid://b3l6ubftmbduk"),
	preload("uid://dxkxi58ls62ri"),
	preload("uid://csaeomm0bv2m4"),
	preload("uid://deomkpjtbqjfe")
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
