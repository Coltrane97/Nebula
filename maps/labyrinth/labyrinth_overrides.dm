/datum/computer_file/program/merchant
	required_access = null

/obj/machinery/power/smes/buildable/labyrinth
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil/super_capacity = 4)

/obj/machinery/power/port_gen/pacman/super/potato
	desc           = "PTTO-3, an industrial all-in-one nuclear power plant by Neo-Chernobyl GmbH. Rated for 250 kW max safe output."
	power_gen      = 250 KILOWATTS
	time_per_sheet = 7200

/obj/machinery/suit_cycler/mining
	helmet = /obj/item/clothing/head/helmet/space/void/mining
	suit = /obj/item/clothing/suit/space/void/mining
	boots = /obj/item/clothing/shoes/magboots

/datum/spawnpoint/cryo/after_join(mob/living/carbon/human/victim)
	if(!istype(victim))
		return

	var/area/A = get_area(victim)
	var/list/spots = list()

	for(var/obj/machinery/cryopod/C in A)
		if(!C.occupant)
			spots += C

	if(!length(spots))
		turfs -= get_turf(victim)
		return

	for(var/obj/machinery/cryopod/C in shuffle(spots))
		if(!C.occupant)

			// Store any held or equipped items.
			var/obj/item/storage/backpack/pack = victim.back
			if(istype(pack))
				for(var/atom/movable/thing in victim.get_held_items())
					victim.drop_from_inventory(thing)
					pack.handle_item_insertion(thing)

			C.set_occupant(victim, 1)
			victim.sleeping = 0
			victim.Sleeping(rand(2,7))
			victim.bodytemperature = victim.species.cold_level_1 //very cold, but a point before damage
			to_chat(victim,SPAN_NOTICE("You are slowly waking up from the cryostasis aboard [GLOB.using_map.full_name]. It might take a few seconds."))
			break
