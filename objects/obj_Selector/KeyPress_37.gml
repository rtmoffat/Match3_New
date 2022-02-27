/// @description Insert description here
// You can write your code in this editor
show_debug_message("hi")
curr_dot_inst=instance_place(x,y,obj_Dot)
if curr_dot_inst {
	if curr_dot_inst.selected {
		neighbor_inst=instance_place(x-64,y,obj_Dot)
		if neighbor_inst {
			curr_dot_inst.x-=64
			neighbor_inst.x+=64
			curr_dot_inst.selected=0
			//Destroy obj_Selected instace
			instance_destroy(instance_place(x,y,obj_Selected))
			//Move the selector after moving dot
		}
	}
	x-=64
}
else {
	x-=64
}