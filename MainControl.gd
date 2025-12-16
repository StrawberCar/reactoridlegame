extends Node2D

@onready var moneytxt = $CurrencyBG/Money
@onready var researchtxt = $CurrencyBG/Research

func _process(_delta: float) -> void:
	moneytxt.text = str(Globals.money)
	researchtxt.text = str(Globals.research)
