extends Node

var is_first_run   : bool   = true
var chosen_class   : String = ""
var current_wave   : int    = 1
var tutorial_step  : int    = 0
var run_result     : String = ""
var waves_reached  : int    = 0

func mark_tutorial_complete() -> void:
	is_first_run = false
	var f := FileAccess.open("user://save.dat", FileAccess.WRITE)
	f.store_var({ "is_first_run": false })
	f.close()

func load_save() -> void:
	if not FileAccess.file_exists("user://save.dat"):
		return
	var f := FileAccess.open("user://save.dat", FileAccess.READ)
	var data = f.get_var()
	f.close()
	if data and data.has("is_first_run"):
		is_first_run = data["is_first_run"]

func reset_run() -> void:
	chosen_class  = ""
	current_wave  = 1
	tutorial_step = 0
	run_result    = ""
	waves_reached = 0
