extends Node

func _ready():
	pause_mode = PAUSE_MODE_PROCESS		# global should never be paused

func _unhandled_input(event):
	if event.is_action_pressed("menu"):	# instead of quitting, show the menu
		#get_tree().quit()
		var menu = get_node_or_null("/root/Game/Menu")
		if menu != null:
			if not menu.visible:
				menu.show()
				get_tree().paused = true 	# pause the game while the menu is visible
			else:
				menu.hide()
				get_tree().paused = false
Then add the following functionality to res://UI/Menu.gd:

extends Control

func _on_Restart_pressed():				# if we restart, then unpause the game and the reload the scene
	get_tree().paused = false
	get_tree().change_scene("res://Maze/Maze.tscn")

func _on_Quit_pressed():
	get_tree().quit()
