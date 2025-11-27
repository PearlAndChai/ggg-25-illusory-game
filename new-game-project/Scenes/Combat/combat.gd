extends Node2D

var actionPressed = -1 # -1 = action has been selected, 0 = no action selected
var actionsDone = 0 # How many actions have been done

var bookNormalCount = 0
var bookSpecialCount = 0

var pencilNormalCount = 0
var pencilSpecialCount = 0

var weaponEquipped = null

var abilitySelected = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_use_button_down():
	if actionPressed == 1 && actionsDone < 5: # If  an action has been selected
		
		if abilitySelected == "normal":
			if weaponEquipped == "book":
				bookNormalCount += 1 # increase the amount of normal spells that have been cast by one
				print("bookNormalCount: ", bookNormalCount)
			else:
				pencilNormalCount += 1 # increase the amount of normal spells that have been cast by one
				print("pencilNormalCount: ", pencilNormalCount)

		elif abilitySelected == "special":
			if weaponEquipped == "book":
				bookSpecialCount += 1 # increase the amount of normal spells that have been cast by one
				print("bookSpecialCount: ", bookSpecialCount)
			else:
				pencilSpecialCount += 1 # increase the amount of normal spells that have been cast by one
				print("pencilSpecialCount: ", pencilSpecialCount)
				
		else:
			if weaponEquipped == "book":
				print("super special attack done")
			else:
				print("super special attack done")
			
			
		actionsDone += 1 # Increment the amount of actions done
		actionPressed = -1 # Set whether an action has been selected to false
		print("u have actioned this many times: " , actionsDone)
		
		if actionsDone == 3: # If three actions have been done
			print("three actions have been done :o")
	else:
		print("u deselected it or never selected it or are out of moves")


func _on_inventory_button_down():
	pass # Replace with function body.


func _on_ability_one_button_down():
	abilitySelected = "normal"
	actionPressed *= -1
	print("action one pressed")

func _on_ability_two_button_down():
	if bookNormalCount >= 2:
		abilitySelected = "special"
		actionPressed *= -1
		print("action two pressed")
	else:
		print("not enough times of using the normal ability, you are at: ", bookNormalCount)

func _on_ability_three_button_down():
	if bookSpecialCount >= 2:
		abilitySelected = "super_special"
		actionPressed *= -1
		print("action three pressed")
	else: 
		print("not enough times of using the special ability, you are at: ", bookSpecialCount)

func _on_book_button_down():
	weaponEquipped = "book"

func _on_pencil_button_down():
	weaponEquipped = "pencil"
