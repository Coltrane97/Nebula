#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/content/bigpharma/_bigpharma.dme"

	#include "../../mods/mobs/dionaea/_dionaea.dme"
	#include "../../mods/mobs/borers/_borers.dme"

	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/species/neocorvids/_neocorvids.dme"
	#include "../../mods/species/tritonian/_tritonian.dme"

// STARLIGHT MODS START

	// General content mod
	#include "../../starlight/mods/content/starlight/_starlight.dme"

	// Species mods
	#include "../../starlight/mods/species/booster/_booster.dme"
	#include "../../starlight/mods/species/vatgrown/_vatgrown.dme"

// STARLIGHT MODS END

	#include "../random_ruins/exoplanet_ruins/playablecolony/playablecolony.dm"
	#include "../../mods/content/government/away_sites/icarus/icarus.dm"
	#include "../../mods/content/government/ruins/ec_old_crash/ec_old_crash.dm"
	#include "../../mods/content/corporate/away_sites/lar_maria/lar_maria.dm"

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

	#include "labyrinth_antagonists.dm"
	#include "labyrinth_areas.dm"
	#include "labyrinth_exoplanet.dm"
	#include "labyrinth_jobs.dm"
	#include "labyrinth_loadout.dm"
	#include "labyrinth_lobby_tracks.dm"
	#include "labyrinth_lore.dm"
	#include "labyrinth_map.dm"
	#include "labyrinth_overmap.dm"
	#include "labyrinth_overrides.dm"
	#include "labyrinth_shuttles.dm"
	#include "labyrinth_turbolift.dm"
	#include "labyrinth_unit_testing.dm"

	#include "jobs/_goals.dm"
	#include "jobs/_jobs.dm"
	#include "jobs/command.dm"
	#include "jobs/engineering.dm"
	#include "jobs/medical.dm"
	#include "jobs/science.dm"

	#include "machinery/airlock.dm"

	#include "outfits/_outfits.dm"
	#include "outfits/command.dm"
	#include "outfits/engineering.dm"
	#include "outfits/medical.dm"
	#include "outfits/science.dm"

	#include "labyrinth-1.dmm"
	#include "labyrinth-2.dmm"
	#include "labyrinth-3.dmm"
	#include "labyrinth-admin.dmm"

	#define USING_MAP_DATUM /datum/map/labyrinth

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Labyrinth

#endif