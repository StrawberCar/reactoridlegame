extends Node2D

@onready var moneytxt = $CurrencyBG/Money
@onready var researchtxt = $CurrencyBG/Research
@onready var capacitytxt = $CapacityBG/CapacityText
@onready var fuel1 = preload("res://Scenes/FuelCell1.tscn")

@onready var currentcapacity = SaveManager.data.FuelCapacity
@onready var fuelcapacity = SaveManager.data.FuelCapacity
@onready var money = SaveManager.data.Money
@onready var research = SaveManager.data.Research

@onready var SellableFuelClock = 0

func _process(_delta: float) -> void:
	currentcapacity = SaveManager.data.FuelCapacity
	fuelcapacity = SaveManager.data.FuelCapacity
	money = SaveManager.data.Money
	research = SaveManager.data.Research
	moneytxt.text = str(money)
	researchtxt.text = str(research)
	capacitytxt.text = str(Globals.currentcapacity, "/", fuelcapacity)

	if Globals.currentcapacity >= fuelcapacity:
		$SpawnFuel.disabled = true
	elif Globals.currentcapacity < fuelcapacity:
		$SpawnFuel.disabled = false



func _on_auto_fuel_toggled(toggled_on: bool) -> void:
	click()
	match toggled_on:
		true:
			$AutoFuel.text = "Off"
		false:
			$AutoFuel.text = "On"



func click():
	$Click.play()



func _on_spawn_fuel_pressed() -> void:
	click()
	if Globals.currentcapacity < fuelcapacity:
		spawnfuel()




func spawnfuel() -> void:
	Globals.currentcapacity += 1
	var fuel = fuel1.instantiate()
	add_child(fuel)
	if SellableFuelClock == 0:
		fuel.global_position = $FuelEmmiter1/Marker2D.global_position
		SellableFuelClock = 1
	elif SellableFuelClock == 1:
		fuel.global_position = $FuelEmmiter2/Marker2D.global_position
		SellableFuelClock = 0
