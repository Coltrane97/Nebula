/datum/map/tokinori
	use_overmap         = 1
	overmap_event_areas = 12
	num_exoplanets      = 2
	planet_size         = list(129,129)

//station

/obj/effect/overmap/visitable/ship/tokinori
	name         = "hovering station"
	color        = "#ffff00"
	var/obj/effect/overmap/visitable/sector/exoplanet/orbit = /obj/effect/overmap/visitable/sector/exoplanet/barren

/obj/effect/overmap/visitable/ship/tokinori/Initialize()
	. = ..()
	INCREMENT_WORLD_Z_SIZE
	orbit = new orbit
	orbit.build_level(GLOB.using_map.planet_size[1], GLOB.using_map.planet_size[2])
	orbit.forceMove(get_turf(src))
	orbit.atmosphere = GLOB.using_map.get_exterior_atmosphere()
	for(var/mat in orbit.atmosphere) orbit.atmosphere[mat] *= 3