/obj/effect/overmap/visitable/sector/exoplanet/volcanic/labyrinth
	name = "\improper Earth"
	free_landing = TRUE
	ruin_tags_whitelist = 1 //stub for no ruins
	possible_themes = list()
	planetary_area = /area/exoplanet/volcanic/labyrinth
	map_generators = list(
		/datum/random_map/automata/cave_system/mountains/volcanic/labyrinth,
		/datum/random_map/noise/exoplanet/volcanic/labyrinth,
		/datum/random_map/noise/ore/filthy_rich
	)

	initial_restricted_waypoints = list(
		"Exploration Shuttle" = list(
			"nav_labyrinth_dock"
		)
	)

/obj/effect/overmap/visitable/ship/landable/exploration_shuttle
	name    = "Exploration Shuttle"
	shuttle = "Exploration Shuttle"
