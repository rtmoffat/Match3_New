/// @description Insert description here
// You can write your code in this editor
//y=y+64
show_debug_message("you pushed the selector down")
curr_dot_inst=instance_place(x,y,obj_Dot)
if curr_dot_inst {
	if curr_dot_inst.selected {
		neighbor_inst=instance_place(x,y+64,obj_Dot)
		if neighbor_inst {
			curr_dot_inst.y+=64
			neighbor_inst.y-=64
			curr_dot_inst.selected=0
			//Destroy obj_Selected instace
			instance_destroy(instance_place(x,y,obj_Selected))
			//Move the selector after moving dot
		}
	}
	y+=64
}
else {
	y+=64
}