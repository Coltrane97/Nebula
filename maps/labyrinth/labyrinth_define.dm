/datum/map/labyrinth
	path = "labyrinth"

	name           = "Labyrinth"
	full_name      = "Labyrinth Facility"
	station_name   = "Labyrinth Facility"
	station_short  = "Labyrinth"

	dock_name      = "Underground City"
	boss_name      = "Service Signal"
	boss_short     = "SS"
	company_name   = "Kungshall"
	company_short  = "KS"

	lobby_screens = list('maps/labyrinth/media/labyrinth.png')
	welcome_sound = 'maps/labyrinth/media/welcome.ogg'

	station_levels = list(1,2,3)
	contact_levels = list(1,2,3)
	player_levels  = list(1,2,3)
	admin_levels   = list(4)

	use_overmap         = TRUE
	overmap_event_areas = 6
	num_exoplanets      = 2

	emergency_shuttle_leaving_dock   = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type             = /datum/evacuation_controller/lifepods

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Ensure that all areas all shielded properly. EVA cut recommended."

	radiation_detected_sound = 'maps/labyrinth/media/threat.ogg'
	space_time_anomaly_sound = 'maps/labyrinth/media/subspace.ogg'
	unidentified_lifesigns_sound = 'maps/labyrinth/media/threat.ogg'
	command_report_sound = 'maps/labyrinth/media/attention.ogg'
	grid_check_sound = 'maps/labyrinth/media/warning.ogg'
	grid_restored_sound = 'maps/labyrinth/media/warning.ogg'
	meteor_detected_sound = 'maps/labyrinth/media/threat.ogg'

	starting_money   = 120000
	department_money = 9000
	salary_modifier  = 3

	allowed_spawns = list("Cryogenic Storage")
	default_spawn  = "Cryogenic Storage"
