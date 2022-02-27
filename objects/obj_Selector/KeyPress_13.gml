/// @description Insert description here
// You can write your code in this editor
show_debug_message(string(sprite_xoffset))
show_debug_message(string(sprite_yoffset))
if !place_meeting(x,y,obj_Dot) {
	instance_create_depth(x,y,1,obj_Dot)
	show_debug_message("Creating")
}
else {
		if !place_meeting(x,y,obj_Selected) {
			instance_create_depth(x,y,1,obj_Selected)
			//instance_destroy(instance_place(x,y,obj_Dot))
			my_dot_inst=instance_place(x,y,obj_Dot)
			my_dot_inst.selected=1
			show_debug_message("Selecting")
	}
	else {
			//De-Selection code
			instance_destroy(instance_place(x,y,obj_Selected))
			show_debug_message("De-Selecting")
			my_dot_inst=instance_place(x,y,obj_Dot)
			my_dot_inst.selected=0
	}
}
