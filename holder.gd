extends Node2D

var cards: Array = []




func _on_child_entered_tree(node: Node) -> void:
	cards.append(node)
	print(cards)


func _on_child_exiting_tree(node: Node) -> void:
	cards.erase(node)
	print(cards)
