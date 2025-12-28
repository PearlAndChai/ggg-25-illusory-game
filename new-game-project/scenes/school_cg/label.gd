extends Label

@onready var classroom = $"../classroom"
@onready var cat = $"../cat"
@onready var door = $"../door"
@onready var look_door = $"../look_door"

var frame = 0

const dialogue = [
"Lucy: My classroom… Finally, something that looks normal.",
"Lucy: This Alex… he looks normal, too.",
"Lucy: H-hello?",
"Alex: …Who are you?",
"Lucy: I’m Lucy. What’s your name?",
"Alex: …Alex.",
"Lucy: Y-you’re, um, the first human I’ve seen here. Everyone else is some kind of weird monster.",
"Alex: Did the cat lead you here too?",
"Lucy: You saw the cat?",
"Alex: Yeah. I’m pretty sure it’s what brought us into this weird world.",
"Lucy: Why would the cat bring us here? Did it have some sort of goal?",
"Lucy: Maybe once it completes it’s goal, it’ll take us home!",
"Alex: Who knows? I don’t care, either way. It makes no difference to me whether I go home or not.",
"Lucy: H-huh? Why not?",
"Alex: I have just as many friends here as I do at home. Zero. Why bother going back, if nobody’s going to miss me while I’m gone?",
"Alex: You should go, though. I’m sure you’ve got people who are worried about you.",
"Lucy: …",
"Alex: W-what are you doing?",
"Lucy: Hugging you.",
"Alex: Why?",
"Lucy: I-I don’t have any friends back home, either. A lot of the people at school bully me, and everyone else just avoids me.",
"Lucy: They think I’m weird and childish.",
"Lucy: That doesn’t mean I’m gonna give up, though, and neither should you. People will still miss you. I’ll miss you.",
"Alex: I- you-",
"Lucy: Let’s go back together. I’ll be your friend, and you can be mine!",
"Alex: You make it sound so easy. I don’t have any friends for a reason. People have a reason for not liking me.",
"Lucy: So? Most people don’t like me either. What if it is that easy?",
"Alex: …Fine, let’s go back.",
"Alex: How are we even going to get back?",
"Lucy: I’m sure the cat will handle it, right?",
"Lucy: See?",
"Alex: ...I think I’m gonna be sick.",
"Lucy: Alex, look!",
"Lucy: It’s normal outside! We’re back home!",
"Alex: …Wait, that wasn’t a dream? We’re at school…",
"Lucy: Who cares? We’re back in the normal world, that’s all that matters.",
"Lucy: Oh, and we’re friends now! You’re my first friend!",
"Alex: …Yeah. Friends.",
"Alex: C’mon, let’s go home."

]

func _ready():
	for i in dialogue.size():
		frame = i
		text = dialogue[i]
		await get_tree().create_timer(0.1).timeout
		
func _process(_delta):
		if frame == 0:
			classroom.visible = true
			
		if frame == 32:
			cat.visible = true
			
		if frame == 35:
			door.visible = true
			
		if frame == 31:
			look_door.visible = true
		
