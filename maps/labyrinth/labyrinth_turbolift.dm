//Elevator

/obj/turbolift_map_holder/labyrinth
	depth        = 3
	lift_size_x  = 4
	lift_size_y  = 3
	areas_to_use = list(
		/area/turbolift/labyrinth_under,
		/area/turbolift/labyrinth_surface,
		/area/turbolift/labyrinth_tower
	)

/area/turbolift
	name             = "Main Elevator"
	icon_state       = "shuttle"
	requires_power   = FALSE
	dynamic_lighting = TRUE

/area/turbolift/labyrinth_tower
	name      = "Tower Access"
	base_turf = /turf/simulated/open

/area/turbolift/labyrinth_surface
	name      = "Surface Access"
	base_turf = /turf/simulated/open

/area/turbolift/labyrinth_under
	name      = "Underground Access"
	base_turf = /turf/simulated/floor/plating
