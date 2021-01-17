/obj/machinery/fabricator/industrial
	name = "industrial fabricator"
	desc = "An enormous, powerful integrated fabrication system for producing pretty much anything."
	active_power_usage    = 20 KILOWATTS
	build_time_multiplier = 0.2
	fabricator_sound      = 'sound/machines/copier.ogg'
	var/find_name         = "NONE"
	base_storage_capacity = list(
		/decl/material/solid/metal/steel      = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/metal/osmium     = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/metal/aluminium  = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/plastic          = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/glass            = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/metal/gold       = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/metal/silver     = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/metal/uranium    = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/gemstone/diamond = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/cloth            = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/leather          = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/cardboard        = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/metal/titanium   = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/metal/plasteel   = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/leather/synth    = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/wood             = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/solid/meat             = SHEET_MATERIAL_AMOUNT * 120,
		/decl/material/liquid/nutriment          =                     1000,
		/decl/material/liquid/acid               =                     1000,
		/decl/material/liquid/acid/hydrochloric  =                     1000,
		/decl/material/liquid/acid/polyacid      =                     1000
	)

/obj/machinery/fabricator/industrial/verb/setfind()
	set name     = "Set Fabricator Search"
	set category = "Object"
	set src in range(1)
	var/mob/living/carbon/human/H = usr
	if(!istype(H) || H.incapacitated()) return
	find_name = sanitize(input(H,"Search Setting",name,"NONE") as text)
	refresh_design_cache()
	updateUsrDialog()

/obj/machinery/fabricator/industrial/refresh_design_cache(var/list/known_tech)
	for(var/ftype in SSfabrication.locked_recipes)
		for(var/datum/fabricator_recipe/design in SSfabrication.locked_recipes[ftype])
			design_cache |= design
	for(var/datum/fabricator_recipe/R in design_cache)
		if(length(R.species_locked) || !findtext(R.name,find_name))
			design_cache.Remove(R)

/datum/fabricator_recipe/arms_ammo/hidden
	hidden = FALSE
/datum/fabricator_recipe/arms_ammo/gun
	path = /obj/item/gun/projectile/pistol
/datum/fabricator_recipe/arms_ammo/gun/revolver
	path = /obj/item/gun/projectile/revolver
/datum/fabricator_recipe/arms_ammo/gun/smg
	path = /obj/item/gun/projectile/automatic/smg
/datum/fabricator_recipe/arms_ammo/gun/shotgun
	path = /obj/item/gun/projectile/shotgun/pump
/datum/fabricator_recipe/textiles/insulateds
	path = /obj/item/clothing/gloves/insulated
/datum/fabricator_recipe/arms_ammo/gun/capacitor
	path = /obj/item/gun/energy/capacitor/empty
/datum/fabricator_recipe/arms_ammo/gun/capacitor/rifle
	path = /obj/item/gun/energy/capacitor/rifle/empty

/obj/item/gun/energy/capacitor/empty
	cell_type  = null
	capacitors = null

/obj/item/gun/energy/capacitor/rifle/empty
	cell_type  = null
	capacitors = null

//airlocks

/obj/machinery/door/airlock
	autoclose = 0

/obj/machinery/door/airlock/Bumped(atom/AM)
	if(panel_open || operating) return
	if(ismob(AM))
		var/mob/M = AM
		if(world.time - M.last_bumped <= 10) return
		M.last_bumped = world.time
		if(!M.restrained() && (!issmall(M) || ishuman(M) || issilicon(M)))
			do_animate("deny")
		return

//ship

//#include "ship.dmm"
#define  MAINSHIP "spaceship"
#include "ship.dmm"

/area/ship/main
	name = MAINSHIP

//data

/obj/effect/overmap/visitable/ship/landable/main
	name       = MAINSHIP
	shuttle    = MAINSHIP
	burn_delay = 1 SECONDS

/datum/shuttle/autodock/overmap/main
	name             = MAINSHIP
	shuttle_area     = /area/ship/main
	dock_target      = null
	current_location = null

//console

/obj/machinery/computer/shuttle_control/explore/main
	name        = "shuttle console"
	shuttle_tag = MAINSHIP

//unit testing

/datum/map/war/apc_test_exempt_areas = list(/area/ship/main = NO_SCRUBBER|NO_VENT)

#undef MAINSHIP