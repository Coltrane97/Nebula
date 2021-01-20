/obj/machinery/computer/shuttle_control/explore/exploration_pod
	name        = "exploration shuttle control console"
	shuttle_tag = "Exploration Shuttle"

/datum/shuttle/autodock/overmap/exploration_pod
	name = "Exploration Shuttle"
	shuttle_area = /area/labyrinth/exploration_pod
	dock_target  = "labyrinth_shuttle"
	current_location = "nav_labyrinth_dock"

/area/labyrinth/exploration_pod
	name       = "\improper Exploration Shuttle"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT

/obj/effect/shuttle_landmark/exploration_pod/labyrinth
	name               = "Labyrinth Exploration Shuttle Dock"
	landmark_tag       = "nav_labyrinth_dock"
	docking_controller = "labyrinth_dock_port"

/datum/shuttle/autodock/ferry/supply/lift
	name = "Cargo Lift"
	location = 1
	warmup_time = 10
	shuttle_area = /area/labyrinth/cargo/lift
	waypoint_offsite = "nav_cargo_start"
	waypoint_station = "nav_cargo_storage"

/obj/effect/shuttle_landmark/supply/deep
	name = "Deep Storage"
	landmark_tag = "nav_cargo_start"

/obj/effect/shuttle_landmark/supply/complex
	name = "Cargo Storage"
	landmark_tag = "nav_cargo_storage"
	base_area = /area/labyrinth/cargo/storage
	base_turf = /turf/simulated/floor/plating
