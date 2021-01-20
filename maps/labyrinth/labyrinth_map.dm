
/datum/map/labyrinth
	base_turf_by_z = list(
		"1" = /turf/exterior/lava,
		"2" = /turf/simulated/open,
		"3" = /turf/simulated/open
	)

/datum/random_map/automata/cave_system/mountains/volcanic/labyrinth
	target_turf_type = /turf/unsimulated/mask
	floor_type = /turf/exterior/volcanic

/datum/random_map/noise/exoplanet/volcanic/labyrinth
	target_turf_type = /turf/exterior/volcanic

/datum/map/labyrinth/build_exoplanets()
	..()
	var/obj/effect/overmap/visitable/sector/exoplanet/new_planet = new /obj/effect/overmap/visitable/sector/exoplanet/volcanic/labyrinth(null, station_levels.len)
	new_planet.build_level(planet_size[1], planet_size[2])
	exterior_atmosphere.copy_from(new_planet.atmosphere)
