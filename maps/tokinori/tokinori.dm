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

	#include "../antag_spawn/heist/heist.dm"

	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/mobs/dionaea/_dionaea.dme"

	#include "../away/bearcat/bearcat.dm"
	#include "../away/casino/casino.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/mining/mining.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away/yacht/yacht.dm"

	#include "map/content/tokinori_areas.dm"
	#include "map/content/tokinori_machinery.dm"
	#include "map/content/tokinori_misc.dm"
	#include "map/content/tokinori_presets.dm"

	#include "overmap/tokinori_overmap.dm"
	#include "overmap/tokinori_shuttles.dm"

	#include "map/tokinori-1.dmm"
	#include "map/tokinori-2.dmm"
	#include "map/tokinori-3.dmm"
	#include "map/tokinori-4.dmm"
	#include "map/tokinori-5.dmm"
	#include "map/tokinori-6.dmm"

	#define USING_MAP_DATUM /datum/map/tokinori

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tokinori

#endif
