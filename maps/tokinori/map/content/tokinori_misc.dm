//Sky

/datum/controller/subsystem/skybox/Initialize()
	skybox_icon         = 'maps/tokinori/media/sky.dmi'
	background_icon     = "sky"
	background_color    = "#26251b" //"#36382a" //"#4b4338"
	use_stars           = FALSE
	use_overmap_details = FALSE
	. = ..()

/turf/space/sky
	name             = "sky"
	icon_state       = "map"
	dynamic_lighting = 1

/turf/space/sky/Initialize()
	. = ..()
	if(prob(5)) set_light(1, 0.1, rand(6,8), 2, COLOR_WARM_YELLOW)

/datum/map/tokinori
	exterior_atmos_temp             = T0C - 93
	exterior_atmos_composition      = list(
		/decl/material/gas/carbon_dioxide = 0.67 * 100,
		/decl/material/gas/nitrogen       = 0.20 * 100,
		/decl/material/gas/argon          = 0.12 * 100,
		/decl/material/gas/krypton        = 0.01 * 100
	)

/turf/space/sky/return_air()
	return GLOB.using_map.get_exterior_atmosphere()

/datum/map/tokinori
	base_turf_by_z = list(
	"1" = /turf/space/sky,
	"2" = /turf/space/sky,
	"3" = /turf/space/sky,
	"4" = /turf/space/sky,
	"5" = /turf/space/sky,
	"6" = /turf/space/sky)