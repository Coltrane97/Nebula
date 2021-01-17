#if !defined(USING_MAP_DATUM)

// STARLIGHT MODS START
	#include "../../starlight/mods/content/starlight/_starlight.dme"
	#include "../../starlight/mods/species/vatgrown/_vatgrown.dme"
// STARLIGHT MODS END
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/mobs/dionaea/_dionaea.dme"
	#include "../../mods/species/neocorvids/_neocorvids.dme"
	#include "../../mods/species/tajaran/_tajaran.dme"

#include "content.dm"

/datum/map/war
	path                 = "war"
	station_levels       = list(1)
	contact_levels       = list(1)
	player_levels        = list(1)
	company_name         = "Legit Cargo Ltd."
	company_short        = "LC"
	evac_controller_type = /datum/evacuation_controller/lifepods
	exterior_atmos_temp  = T0C - 23
	exterior_atmos_composition = list(
		/decl/material/gas/oxygen   = O2STANDARD   *100,
		/decl/material/gas/nitrogen = N2STANDARD   *100
	)
	use_overmap    = 1
	num_exoplanets = 0
	allowed_jobs = list(/datum/job/assistant)

/datum/job/assistant
	outfit_type  = null
	skill_points = 24

/obj/machinery/Initialize()
	. = ..()
	req_access = list()

var/obj/effect/overmap/visitable/sector/exoplanet/planet = /obj/effect/overmap/visitable/sector/exoplanet/snow
var/maplevel

/datum/controller/subsystem/misc_late/Initialize()
	GLOB.using_map.name          = "[uppertext(pick(SSlore.dreams))] [pick(list("Complex","Factory","Facility"))] [rand(1,9999)]"
	GLOB.using_map.full_name     = GLOB.using_map.name
	GLOB.using_map.station_name  = GLOB.using_map.name
	GLOB.using_map.station_short = GLOB.using_map.name

	world.name = "Starlight RU: [GLOB.using_map.full_name]"
	world.maxz = 1
	world.maxx = 80
	world.maxy = 80
	global.maplevel = world.maxz
	planet          = new planet
	planet.map_z    = list(global.maplevel)
//	planet.build_level(world.maxx,world.maxy)

	. = ..()

#define USING_MAP_DATUM /datum/map/war

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring war

#endif