/datum/map/tokinori
	name           = "Tokinori"
	full_name      = "Tokinori"
	path           = "tokinori"

	station_levels = list(1, 2, 3, 4, 5, 6)
	contact_levels = list(1, 2, 3, 4, 5, 6)
	player_levels  = list(1, 2, 3, 4, 5, 6)

	station_name   = "Tokinori"
	station_short  = "Tokinori"

	dock_name      = "FTS Capitalist's Rest"
	boss_name      = "FTU Merchant Navy"
	boss_short     = "Merchant Admiral"
	company_name   = "Legit Cargo Ltd."
	company_short  = "LC"

	welcome_sound                    = 'sound/effects/cowboysting.ogg'
	emergency_shuttle_leaving_dock   = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type             = /datum/evacuation_controller/lifepods

	starting_money   = 14000
	department_money = 7000
	salary_modifier  = 0.5

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Please move to a shielded area until the radiation has passed."

/datum/map/tokinori/get_map_info()
	return "You're aboard the <b>[station_name],</b> a station floating in atmosphere of some desolate exoplanet. \
	No meaningful authorities can claim the planets and resources in this uncharted sector, so their exploitation is entirely up to you - mine, poach and deforest all you want."

/datum/map/tokinori/setup_map()
	..()
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining