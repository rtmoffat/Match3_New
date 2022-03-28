/// @description Insert description here
// You can write your code in this editor
//y=y-64
show_debug_message("you pushed the selector up")
curr_dot_inst=instance_place(x,y,obj_Dot)
neighbor_inst=instance_place(x,y-64,obj_Dot)
selected_highlight=instance_place(x,y,obj_Selected)
if curr_dot_inst {
	if (curr_dot_inst.selected and neighbor_inst) {
			curr_dot_inst.y-=64
			neighbor_inst.y+=64
			//CONTINUOUS curr_dot_inst.selected=0
			//Destroy obj_Selected instace
			//CONTINUOUS instance_destroy(instance_place(x,y,obj_Selected))
			//Move the selector after moving dot
	}
	if neighbor_inst {
		y-=64
	}
}
else if neighbor_inst {
	y-=64
}
if (selected_highlight) {
	selected_highlight.y=y
}