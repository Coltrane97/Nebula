/datum/map/labyrinth
	base_turf_by_z = list(
		"1" = /turf/exterior/lava,
		"2" = /turf/simulated/open,
		"3" = /turf/simulated/open
	)

/datum/random_map/automata/cave_system/mountains/volcanic/labyrinth
	target_turf_type = /turf/unsimulated/mask
	floor_type = /turf/unsimulated/mask

/datum/random_map/noise/exoplanet/volcanic/labyrinth
	target_turf_type = /turf/unsimulated/mask

/datum/map/labyrinth/build_exoplanets()
	if(!use_overmap)
		return
	if(LAZYLEN(planet_size))
		if(world.maxx < planet_size[1])
			world.maxx = planet_size[1]
		if(world.maxy < planet_size[2])
			world.maxy = planet_size[2]
	for(var/i = 0, i < num_exoplanets, i++)
		var/exoplanet_type = pick(subtypesof(/obj/effect/overmap/visitable/sector/exoplanet) - /obj/effect/overmap/visitable/sector/exoplanet/volcanic/labyrinth)
		INCREMENT_WORLD_Z_SIZE
		var/obj/effect/overmap/visitable/sector/exoplanet/new_planet = new exoplanet_type(null, world.maxz)
		new_planet.build_level(planet_size[1], planet_size[2])

	var/obj/effect/overmap/visitable/sector/exoplanet/labyrinth = new /obj/effect/overmap/visitable/sector/exoplanet/volcanic/labyrinth(null, station_levels.len)
	labyrinth.build_level(planet_size[1], planet_size[2])
	exterior_atmosphere.copy_from(labyrinth.atmosphere)
