/obj/effect/overmap/visitable/sector/exoplanet/volcanic/labyrinth
	name         = "\improper Labyrinth"
	free_landing = TRUE
	known        = TRUE

	initial_generic_waypoints = list("nav_labyrinth_dock")
	initial_restricted_waypoints = list(
		"Exploration Shuttle" = list(
			"nav_labyrinth_dock"
		)
	)

/obj/effect/overmap/visitable/ship/landable/exploration_pod
	name    = "Exploration Shuttle"
	shuttle = "Exploration Shuttle"
