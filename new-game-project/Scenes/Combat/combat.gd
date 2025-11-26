extends Node2D

var actionPressed = -1 # -1 = action has been selected, 0 = no action selected
var actionsDone = 0 # How many actions have been done


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_use_button_down():
	if actionPressed == 1 && actionsDone < 3: # If  an action has been selected
		
		actionsDone += 1 # Increment the amount of actions done
		actionPressed = -1 # Set whether an action has been selected to false
		print("u have clickied: " , actionsDone)
		
		if actionsDone == 3: # If three actions have been done
			print("three actions have been done :o")
	else: # If the player hasn't selected an action
		print("u deselected it or never selected it")


func _on_inventory_button_down():
	pass # Replace with function body.


func _on_ability_one_button_down():
	actionPressed *= -1
	print("action one pressed")

func _on_ability_two_button_down():
	actionPressed *= -1
	print("action two pressed")

func _on_ability_three_button_down():
	actionPressed *= -1
	print("action three pressed")
