// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_MakeBoard(num_Rows=10,num_Cols=10,spacer=10) {
	sh=sprite_get_height(spr_Square)
	sw=sprite_get_width(spr_Square)
	for (i=1;i<num_Rows;i++) {
		for (j=1;j<num_Cols;j++) {
			show_debug_message(string(spacer))
			instance_create_depth((i*(sh+spacer)),(j*(sw+spacer)),1,obj_Square)
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

/*Check vertical and horizontal surroundings for other selected blocks.
Return the instance of the first one we find*/
function chk_Surroundings(selected_instance) {
		
		//Assuming width and height are equal
		spr_Size=sprite_get_width(obj_Square)
		//spr_Size=sprite_get_xoffset(obj_Square)
		var coor_Struct=
		{
			top:
				{
					x:selected_instance.x,
					y:selected_instance.y-(spr_Size+11),
					inst:instance_place(selected_instance.x,selected_instance.y-(spr_Size+11),obj_Square)
				},
			left:
				{
					x:selected_instance.x-(spr_Size+11),
					y:selected_instance.y,
					inst:instance_place(selected_instance.x-(spr_Size+11),selected_instance.y,obj_Square)
				},
			right:
				{
					x:selected_instance.x+(spr_Size+11),
					y:selected_instance.y,
					inst:instance_place(selected_instance.x+(spr_Size+11),selected_instance.y,obj_Square)
				},
			bottom:
				{
					x:selected_instance.x,
					y:selected_instance.y+(spr_Size+11),
					inst:instance_place(selected_instance.x,selected_instance.y+(spr_Size+11),obj_Square)
				}
		}
		show_debug_message("Top Instance="+string(coor_Struct.top.inst))
		show_debug_message("Left Instance="+string(coor_Struct.left.inst))
		show_debug_message("Right Instance="+string(coor_Struct.right.inst))
		show_debug_message("Bottom Instance="+string(coor_Struct.bottom.inst))
		struct_Arr=variable_struct_get_names(coor_Struct)
		
		/*tester="top"
		show_debug_message("Mystruct topx="+string(coor_Struct.top.x))
		tester2=variable_struct_get(coor_Struct,tester)
		show_debug_message("mygotstruct="+string(tester2.x)+typeof(tester2))*/
		
		//Loop through the struct
		
		for (i=0;i<array_length(struct_Arr);i++) {
			myStructVar=variable_struct_get(coor_Struct,struct_Arr[i])
			show_debug_message("myStructVarIndex="+struct_Arr[i]+":"+string(myStructVar.x)+","+string(myStructVar.y))
			//Check adjacent square
			//adj_instance=instance_place(myStructVar.x,myStructVar.y,obj_Square)
			adj_instance=myStructVar.inst
			if adj_instance>=0 {
				if adj_instance.selected {
					show_debug_message(string(adj_instance)+" is next to "+string(selected_instance))
					return adj_instance
				}
			}
		}
		
/*		adj_instance=instance_place(selected_instance.x+spr_Size,selected_instance.y,obj_Square)
		if adj_instance>=0 {
			if adj_instance.selected {
				show_debug_message(string(adj_instance)+" is next to "+string(selected_instance))
				return adj_instance
			}
		}*/
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