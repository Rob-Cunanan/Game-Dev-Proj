extends Control
class_name Card

@export var card_data: CardData

@onready var background = $Background
@onready var frame = $Frame
@onready var art_area = $ArtArea
@onready var art_frame = $ArtFrame
@onready var badge = $Badge
@onready var card_name_label = $CardName
@onready var type_label = $TypeLabel
@onready var effect_label = $RichTextLabel
@onready var rarity_label = $Panel/CostLabel

var rarity_backgrounds = {
	"C": preload("res://Assets/Cards/Backgrounds/bg_common.tres"),
	"UC": preload("res://Assets/Cards/Backgrounds/bg_uncommon.tres"),
	"R": preload("res://Assets/Cards/Backgrounds/bg_rare.tres"),
	"E": preload("res://Assets/Cards/Backgrounds/bg_epic.tres"),
	"L": preload("res://Assets/Cards/Backgrounds/bg_legendary.tres"),
	"M": preload("res://Assets/Cards/Backgrounds/bg_mythic.tres"),
	"EX": preload("res://Assets/Cards/Backgrounds/bg_evolve.tres")
}

var rarity_frames = {
	"C": preload("res://Assets/Cards/Frames/frame_wood.tres"),
	"UC": preload("res://Assets/Cards/Frames/frame_wood.tres"),
	"R": preload("res://Assets/Cards/Frames/frame_wood.tres"),
	"E": preload("res://Assets/Cards/Frames/frame_silver.tres"),
	"L": preload("res://Assets/Cards/Frames/frame_silver.tres"),
	"M": preload("res://Assets/Cards/Frames/frame_gold.tres"),
	"EX": preload("res://Assets/Cards/Frames/frame_evolve.tres")
}

var rarity_artframes = {
	"C": preload("res://Assets/Cards/Frames/artframe_wood.tres"),
	"UC": preload("res://Assets/Cards/Frames/artframe_wood.tres"),
	"R": preload("res://Assets/Cards/Frames/artframe_wood.tres"),
	"E": preload("res://Assets/Cards/Frames/artframe_silver.tres"),
	"L": preload("res://Assets/Cards/Frames/artframe_silver.tres"),
	"M": preload("res://Assets/Cards/Frames/artframe_gold.tres"),
	"EX": preload("res://Assets/Cards/Frames/artframe_evolve.tres")
}

var affinity_badges = {
	"Warrior": preload("res://Assets/Cards/Badges/badge_warrior.tres"),
	"Mage": preload("res://Assets/Cards/Badges/badge_mage.tres"),
	"Priest": preload("res://Assets/Cards/Badges/badge_priest.tres"),
	"Warrior/Mage": preload("res://Assets/Cards/Badges/badge_warrior.tres"),
	"Warrior/Priest": preload("res://Assets/Cards/Badges/badge_warrior.tres"),
	"Mage/Warrior": preload("res://Assets/Cards/Badges/badge_mage.tres"),
	"Mage/Priest": preload("res://Assets/Cards/Badges/badge_mage.tres"),
	"Priest/Mage": preload("res://Assets/Cards/Badges/badge_priest.tres"),
	"Priest/Warrior": preload("res://Assets/Cards/Badges/badge_priest.tres"),
	"Any": preload("res://Assets/Cards/Badges/badge_warrior.tres")
}

var evolve_badges = {
	"Warrior": preload("res://Assets/Cards/Badges/badge_evolve_warrior.tres"),
	"Mage": preload("res://Assets/Cards/Badges/badge_evolve_mage.tres"),
	"Priest": preload("res://Assets/Cards/Badges/badge_evolve_priest.tres")
}

func _ready():
	if card_data:
		setup(card_data)

func setup(data: CardData):
	art_area.texture = data.art
	card_name_label.text = data.card_name
	type_label.text = data.affinity
	effect_label.text = data.effect_text
	rarity_label.text = data.rarity

	if rarity_backgrounds.has(data.rarity):
		background.texture = rarity_backgrounds[data.rarity]

	if rarity_frames.has(data.rarity):
		frame.texture = rarity_frames[data.rarity]

	if rarity_artframes.has(data.rarity):
		art_frame.texture = rarity_artframes[data.rarity]

	# Badge logic — evolve cards get shield badges, others get affinity badges
	if data.rarity == "Evolve":
		if evolve_badges.has(data.affinity):
			badge.texture = evolve_badges[data.affinity]
	else:
		if affinity_badges.has(data.affinity):
			badge.texture = affinity_badges[data.affinity]
