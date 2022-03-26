/// @description Insert description here
// You can write your code in this editor
randomize()
set_globals()
scr_MakeBoard_DOT()
//sh=sprite_get_height(spr_Dot)
//sw=sprite_get_width(spr_Dot)
instance_create_depth(global.sh,global.sw,1,obj_Selector)
