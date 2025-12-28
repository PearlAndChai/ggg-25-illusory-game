extends Label

const dialogue = [
"Lucy: Huh…? What was that?",
"Lucy: Is that the cat from earlier? What’s it doing here?",
"Lucy: Wait, come back!",
"Lucy: Wait, come back!",
"Lucy: What… is this place? Was this the cat’s doing?",
"Lucy: How did I get here? Can the cat take me back?"
]

func _ready():
	for i in dialogue.size():
		text = dialogue[i]
		await get_tree().create_timer(2.0).timeout
