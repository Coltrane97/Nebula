#if !defined(USING_MAP_DATUM)

// STARLIGHT MODS START

	// General content mod
	#include "../../starlight/mods/content/starlight/_starlight.dme"

	// Species mods
	#include "../../starlight/mods/species/booster/_booster.dme"
	#include "../../starlight/mods/species/resomi/_resomi.dme"
	#include "../../starlight/mods/species/vatgrown/_vatgrown.dme"
	#include "../../mods/species/tajaran/_tajaran.dme"

// STARLIGHT MODS END

	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/mobs/dionaea/_dionaea.dme"

//Map define

/datum/map/asteroid
	name          = "Asteroid"
	full_name     = "Asteroid"
	station_name  = "Asteroid"
	station_short = "Asteroid"

	path = "asteroid"

	station_levels = list(1)
	contact_levels = list(1)
	player_levels  = list(1)

	dock_name     = "Sol"
	boss_name     = "RSS Executive"
	boss_short    = "SEO"
	company_name  = "RSS Inc."
	company_short = "RSS"

	evac_controller_type             = /datum/evacuation_controller/lifepods
	emergency_shuttle_leaving_dock   = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."

//overmap

/obj/effect/overmap/visitable/ship/asteroid
	name = "asteroid station"

	#include "asteroid.dmm"

	#define USING_MAP_DATUM /datum/map/asteroid

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Asteroid

#endif
