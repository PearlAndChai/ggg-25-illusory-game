extends Label

const bully_dialogue = [
	"Bully 1: It’s just insane, like, what’s wrong with her?",
	"Bully 2: I know, she’s so weird! Can’t she just grow up already-",
	"Bully 2: -!",
	"Lucy: …",
	"Bully 1: Oh, hey, Lucy, we didn’t see you there!",
	"Bully 2: H-how are you doing today?",
	"Lucy: …",
	"Bully 1: There’s that thing, too. I don’t think I’ve ever heard her speak.",
	"Bully 2: I know, what a weirdo. Why can’t she talk like a normal person?",
	""
]

const cat_dialogue = [
	"Lucy: Cats are so much better than people. They don’t judge you for anything.",
	"Lucy: If everyone else was like you, maybe I would have a friend.",
	"Lucy: …",
	"Lucy: Why am I even talking to you? You’re just a cat, you can’t understand what I’m saying anyway.",
	""
]

const grandma_dialogue = [
	"Grandma: Ah, Lucy! Good to see you, dear. How was school?",
	"Lucy: …Fine.",
	"Grandma: Still no friends at school? You know, when I was your age, I was one of the popular girls. Everyone wanted to be my friend.",
	"Lucy: That’s nice, grandma.",
	"Grandma: And then your grandfather said-",
	"Lucy: Grandma, I have to go home-",
	"Grandma: Really, if you want more friends, you should put yourself out there! There are plenty of lovely children in the neighborhood. Go talk to them! If you still don’t have friends after that, I’ll be surprised!",
	"Lucy: …Thanks, grandma.",
	""
]

func _process(_delta):
	if global_variables.reached_bullies == true:
		global_variables.reached_bullies = false
		global_variables.bullies_dialogue_ran = true
		run_bully_dialogue()
		
	elif global_variables.reached_cat == true:
		global_variables.reached_cat = false
		run_cat_dialogue()
	
	elif global_variables.reached_grandma == true:
		global_variables.reached_grandma = false
		global_variables.grandma_dialogue_ran = true
		run_grandma_dialogue()


func run_bully_dialogue():
	for i in bully_dialogue.size():
		text = bully_dialogue[i]
		await get_tree().create_timer(2.0).timeout
		
func run_cat_dialogue():
	for i in cat_dialogue.size():
		text = cat_dialogue[i]
		await get_tree().create_timer(2.0).timeout
		
func run_grandma_dialogue():
	for i in grandma_dialogue.size():
		text = grandma_dialogue[i]
		await get_tree().create_timer(2.0).timeout
