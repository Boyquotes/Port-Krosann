extends Node2D

func _ready():
	$BuySellAmount/AmountLabel.text = str(Market.buySellAmount)

func _on_BtnBuySellAmount_button_up():
	if Market.buySellAmount == 1:
		Market.buySellAmount = 10
	elif Market.buySellAmount == 10:
		Market.buySellAmount = 100
	elif Market.buySellAmount == 100:
		Market.buySellAmount = 1
	
	$BuySellAmount/AmountLabel.text = str(Market.buySellAmount)
