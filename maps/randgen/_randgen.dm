#if !defined(USING_MAP_DATUM)

#include "generator.dm"

/datum/map/randgen
	path                 = "randgen"
	station_levels       = list(1)
	contact_levels       = list(1)
	player_levels        = list(1)
	company_name         = "Legit Cargo Ltd."
	company_short        = "LC"
	evac_controller_type = /datum/evacuation_controller/lifepods
	exterior_atmos_temp  = T0C - 23
	exterior_atmos_composition = list(
		/decl/material/gas/oxygen = O2STANDARD   *100,
		/decl/material/gas/nitrogen = N2STANDARD *100
	)

var/obj/effect/overmap/visitable/sector/exoplanet/planet = /obj/effect/overmap/visitable/sector/exoplanet/snow
var/maplevel

/datum/controller/subsystem/misc_late/Initialize()
	GLOB.using_map.name          = "[uppertext(pick(SSlore.dreams))] [pick(list("Complex","Factory","Facility"))] [rand(1,9999)]"
	GLOB.using_map.full_name     = GLOB.using_map.name
	GLOB.using_map.station_name  = GLOB.using_map.name
	GLOB.using_map.station_short = GLOB.using_map.name

	world.name = "[server_name]: [GLOB.using_map.full_name]"
	world.maxz = 1
	world.maxx = 80
	world.maxy = 80
	global.maplevel = world.maxz
	planet          = new planet
	planet.map_z    = list(global.maplevel)
	planet.build_level(world.maxx,world.maxy)

	. = ..()

#define USING_MAP_DATUM /datum/map/randgen

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring randgen

#endif