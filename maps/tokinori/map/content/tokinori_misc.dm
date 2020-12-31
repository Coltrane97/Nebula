//Sky

/datum/controller/subsystem/skybox/Initialize()
	skybox_icon         = 'maps/tokinori/media/sky.dmi'
	background_icon     = "sky"
	background_color    = "#4b4338"
	use_stars           = FALSE
	use_overmap_details = FALSE
	. = ..()

/turf/space/sky
	name             = "sky"
	icon_state       = "map"
	dynamic_lighting = 1

/datum/map/tokinori
	exterior_atmos_temp             = T0C - 90
	exterior_atmos_composition      = list(
		/decl/material/gas/carbon_dioxide = 0.67,
		/decl/material/gas/nitrogen       = 0.20,
		/decl/material/gas/argon          = 0.12,
		/decl/material/gas/krypton        = 0.01
	)

/turf/space/sky/return_air()
	return GLOB.using_map.get_exterior_atmosphere()