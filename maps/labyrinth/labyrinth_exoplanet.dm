/obj/effect/overmap/visitable/sector/exoplanet/volcanic/labyrinth
	name = "\improper Labyrinth"
	planetary_area = /area/exoplanet/volcanic/labyrinth
	map_generators = list(
		/datum/random_map/automata/cave_system/mountains/volcanic/labyrinth, 
		/datum/random_map/noise/exoplanet/volcanic/labyrinth, 
		/datum/random_map/noise/ore/filthy_rich
	)
	ruin_tags_whitelist = 1 //stub for no ruins
	possible_themes = list()

/obj/effect/overmap/visitable/sector/exoplanet/volcanic/labyrinth/Initialize(var/mapload, var/z_level)
	. = ..(mapload, GLOB.using_map.station_levels[GLOB.using_map.station_levels.len-1])
	docking_codes = "[GLOB.using_map.dock_name]"