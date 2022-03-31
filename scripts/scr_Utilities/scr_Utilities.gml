//Tester
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*function scr_MakeBoard(num_Rows=10,num_Cols=10,spacer=10) {
	sh=sprite_get_height(spr_Square)
	sw=sprite_get_width(spr_Square)
	for (i=1;i<num_Rows;i++) {
		for (j=1;j<num_Cols;j++) {
			show_debug_message(string(spacer))
			instance_create_depth((i*(sh+spacer)),(j*(sw+spacer)),1,obj_Square)
		}
	}
}*/

function set_globals() {
	global.sh=sprite_get_height(spr_Dot)
	global.sw=sprite_get_width(spr_Dot)
}
//Create board based on dots. No spacers
function scr_MakeBoard_DOT(num_Rows=10,num_Cols=10,spacer=0) {
	/*sh=sprite_get_height(spr_Dot)
	sw=sprite_get_width(spr_Dot)*/
	for (i=1;i<num_Rows;i++) {
		for (j=1;j<num_Cols;j++) {
			show_debug_message(string(spacer))
			instance_create_depth((i*(global.sh+spacer)),(j*(global.sw+spacer)),1,obj_Dot)
		}
	}
}

function chk_Mouse(my_x,my_y) {
	selected_instance=instance_place(my_x,my_y,obj_Square)
	if selected_instance >=0 {
		process_Selection(selected_instance)
		surr_instance=chk_Surroundings(selected_instance)
		show_debug_message("Found "+string(surr_instance))
		if (surr_instance>=0) {
			if (surr_instance.selected) {	
				swap_Squares(selected_instance,surr_instance)
			}
		}
	}
}

function process_Selection(selected_instance) {

	if selected_instance.selected==1 {
		selected_instance.selected=0
		//selected_instance.image_blend=c_white
		show_debug_message("DE-Selected at"+string(mouse_x)+"|"+string(mouse_y)+"|"+string(selected_instance)+string(selected_instance.selected))
	}
	else {
		selected_instance.selected=1
		//selected_instance.image_blend=c_olive
		show_debug_message("Selected at mouse "+string(mouse_x)+"|"+string(mouse_y)+"|"+string(selected_instance)+" Selected= "+string(selected_instance.selected))
	}
}


function swap_Squares(i1,i2) {
	show_debug_message("Swapping "+string(i1)+" with "+string(i2))
	i1.selected=0
	i2.selected=0
	tmp_i1x=i1.x
	tmp_i1y=i1.y
	i1.x=i2.x
	i1.y=i2.y
	i2.x=tmp_i1x
	i2.y=tmp_i1y
	//i1.image_index=2
	//i2.image_index=2
}

function chk_Matches(my_x,my_y) {
	//Check 2 up, 2 down, 2 left, 2 right for same color
	//Up y-spr_Size & y-(spr_Size * 2)
	//Down y+spr_Size & y+(spr_Size * 2)
	//Left x-spr_Size & x-(spr_Size * 2)
	//Right x+spr_Size & x+(spr_Size * 2)
	my_dirs=
		{
			d_left:function(inst,dist=1) {
				coors={
					cx:inst.x-(inst.sprite_width*dist),
					cy:inst.y
				}
				return coors
			},
			d_right:function(inst,dist=1) {
				coors={
					cx:inst.x+(inst.sprite_width*dist),
					cy:inst.y
				}
				return coors
			},
			d_up:function(inst,dist=1) {
				coors={
					cx:inst.x,
					cy:inst.y-(inst.sprite_width*dist)
				}
				return coors
			},
			d_down:function(inst,dist=1) {
				coors={
					cx:inst.x,
					cy:inst.y+(inst.sprite_width*dist)
				}
				return coors
			}
		}
	
	//Check if we're on a dot
	my_inst=instance_place(my_x,my_y,obj_Dot)
	if my_inst>=0 {
			s_names=variable_struct_get_names(my_dirs)
			//Loop through all directions in struct
			for (n=0;n<array_length(s_names);n++) {
				//Check all directions
				my_coors=my_dirs [$ s_names[n]](my_inst,1)
				t_inst=instance_place(my_coors.cx,my_coors.cy,obj_Dot)
				if (t_inst>=0) and (my_inst.image_index==t_inst.image_index) {
						show_debug_message("Match")
				}
			}
	}
}