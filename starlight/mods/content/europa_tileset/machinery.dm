/obj/machinery/power/apc
    icon = 'starlight/mods/content/europa_tileset/icons/machinery/apc.dmi'

/obj/machinery/power/apc/on_update_icon()
    ..()
	if(update_state < 0)
		pixel_x = 0
		pixel_y = 0
		var/turf/T = get_step(get_turf(src), dir)
		if(istype(T) && T.density)
			if(dir == SOUTH)
				pixel_y = -26
			else if(dir == NORTH)
				pixel_y = 26
			else if(dir == EAST)
				pixel_x = 26
			else if(dir == WEST)
				pixel_x = -26

/obj/machinery/light/on_update_icon()
    ..()
	pixel_y = 0
	pixel_x = 0
