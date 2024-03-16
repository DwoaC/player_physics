extends Sprite2D


func _draw():
	draw_line(position, -Vector2.UP.rotated(rotation) * 100, Color(1, 0, 0, 1))
	#draw_line(Vector2.ZERO, position * 2, Color(0., 1., 0., 1.))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
