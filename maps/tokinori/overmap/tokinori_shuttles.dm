/obj/machinery/computer/shuttle_control/explore/tokinori_shuttle
	name = "exploration shuttle console"
	shuttle_tag = "Exploration Shuttle"

/obj/effect/overmap/visitable/ship/landable/tokinori_shuttle
	name    = "Exploration Shuttle"
	shuttle = "Exploration Shuttle"

/area/tokinori/shuttle
	name = "Exploration Shuttle"

/datum/shuttle/autodock/overmap/tokinori_shuttle
	name             = "Exploration Shuttle"
	shuttle_area     = /area/tokinori/shuttle
	dock_target      = "shuttle0"
	current_location = "nav_port_dock"

/obj/effect/shuttle_landmark/tokinori/port_dock
	name               = "Port Docking Port"
	landmark_tag       = "nav_port_dock"
	docking_controller = "port_dock"

/obj/effect/overmap/visitable/ship/tokinori
	initial_restricted_waypoints = list("Exploration Shuttle" = list("nav_port_dock"))