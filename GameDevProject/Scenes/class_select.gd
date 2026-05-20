extends Node2D
 
@onready var warrior_btn   : Button           = $UI/Cards/WarriorCard/VBoxContainer/SelectBtn
@onready var mage_btn      : Button           = $UI/Cards/MageCard/VBoxContainer/SelectBtn
@onready var priest_btn    : Button           = $UI/Cards/PriestCard/VBoxContainer/SelectBtn
@onready var back_btn      : Button           = $UI/BackButton
 
@onready var warrior_sprite: AnimatedSprite2D = $UI/Cards/WarriorCard/VBoxContainer/Sprite
@onready var mage_sprite   : AnimatedSprite2D = $UI/Cards/MageCard/VBoxContainer/Sprite
@onready var priest_sprite : AnimatedSprite2D = $UI/Cards/PriestCard/VBoxContainer/Sprite
 
@onready var warrior_name  : Label            = $UI/Cards/WarriorCard/VBoxContainer/ClassName
@onready var mage_name     : Label            = $UI/Cards/MageCard/VBoxContainer/ClassName
@onready var priest_name   : Label            = $UI/Cards/PriestCard/VBoxContainer/ClassName
 
@onready var warrior_desc  : Label            = $UI/Cards/WarriorCard/VBoxContainer/ClassDesc
@onready var mage_desc     : Label            = $UI/Cards/MageCard/VBoxContainer/ClassDesc
@onready var priest_desc   : Label            = $UI/Cards/PriestCard/VBoxContainer/ClassDesc
 
 
func _ready() -> void:
	GameState.load_save()
 
	warrior_name.text = "Warrior"
	mage_name.text    = "Mage"
	priest_name.text  = "Priest"
 
	warrior_desc.text = "Physical power and durability.\nStarts with more HP.\nAttack cards deal bonus damage."
	mage_desc.text    = "Magic and control.\nStarts with extra AP.\nDraws one more card per turn."
	priest_desc.text  = "Healing and buffs.\nAll heals are stronger.\nReduces incoming damage."
 
	_try_play_idle(warrior_sprite)
	_try_play_idle(mage_sprite)
	_try_play_idle(priest_sprite)
 
	warrior_btn.pressed.connect(_on_warrior_selected)
	mage_btn.pressed.connect(_on_mage_selected)
	priest_btn.pressed.connect(_on_priest_selected)
	back_btn.pressed.connect(_on_back_pressed)
 
 
func _try_play_idle(sprite: AnimatedSprite2D) -> void:
	if sprite == null:
		return
	if sprite.sprite_frames == null:
		return
	if sprite.sprite_frames.has_animation("idle"):
		sprite.play("idle")
 
 
func _on_warrior_selected() -> void:
	_go_to_battle("Warrior")
 
func _on_mage_selected() -> void:
	_go_to_battle("Mage")
 
func _on_priest_selected() -> void:
	_go_to_battle("Priest")
 
func _go_to_battle(chosen: String) -> void:
	GameState.reset_run()
	GameState.chosen_class = chosen
	GameState.current_wave = 1
	get_tree().change_scene_to_file("res://Scenes/Battle.tscn")
 
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
