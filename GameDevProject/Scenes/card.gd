extends Control

@export var card_data: CardData

@onready var art_area = $ArtArea
@onready var card_name_label = $CardName
@onready var type_label = $TypeLabel
@onready var effect_label = $RichTextLabel
@onready var cost_label = $Panel/Label

func _ready():
	if card_data:
		setup(card_data)

func setup(data: CardData):
	art_area.texture = data.art
	card_name_label.text = data.card_name
	type_label.text = data.affinity
	effect_label.text = data.effect_text
	cost_label.text = data.rarity
