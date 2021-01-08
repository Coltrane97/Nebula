//timesavers!

/obj/effect/wallframe_spawn/activate()
	. = ..()
	var/obj/machinery/door/firedoor/fire = locate() in loc
	if(!fire) fire = new(loc)

/obj/machinery/door/airlock/Initialize()
	. = ..()
	if(istype(src,/obj/machinery/door/airlock/external) || istype(src,/obj/machinery/door/airlock/multi_tile)) return
	var/obj/machinery/door/firedoor/fire                     = locate() in loc
	var/obj/effect/floor_decal/industrial/hatch/yellow/decal = locate() in loc
	if(!fire)  fire  = new(loc)
	if(!decal) decal = new(loc)

//autodirs
/atom/proc/walldir(var/bake = TRUE, var/reverse = TRUE, var/offset = FALSE)

	for(var/face in global.cardinal)
		var/turf/T = get_step(src,face)
		if(T.density)
			. = (reverse ? global.reverse_dir[face] : face)
			break

	if(bake && (. in global.cardinal)) dir = .

	if(offset)
		if(. == SOUTH)
			pixel_y = -24
		else if(. == NORTH)
			pixel_y = 24
		else if(. == EAST)
			pixel_x = 24
		else if(. == WEST)
			pixel_x = -24

/obj/machinery/power/apc/Initialize()
	walldir(bake = TRUE, reverse = TRUE)
	. = ..()

/obj/machinery/alarm/Initialize()
	walldir(bake = TRUE, reverse = TRUE)
	. = ..()

/obj/machinery/firealarm/Initialize()
	walldir(bake = TRUE, reverse = TRUE)
	. = ..()

/obj/structure/extinguisher_cabinet/Initialize()
	walldir(bake = TRUE, reverse = TRUE, offset = TRUE)
	. = ..()

/obj/machinery/light_switch/Initialize()
	walldir(bake = FALSE, reverse = TRUE, offset = TRUE)
	. = ..()

//moody

/obj/machinery/door/airlock
	autoclose = 0

/obj/machinery/door/airlock/Bumped(var/atom/AM)
	if(panel_open || operating) return
	if(ismob(AM))
		var/mob/M = AM
		if(world.time - M.last_bumped <= 10) return
		M.last_bumped = world.time
		if(!M.restrained() && (!issmall(M) || ishuman(M) || issilicon(M)))
			do_animate("deny") //so it will not open on bump. click on it, lazy!
		return

//network presets

/obj/machinery/network/mainframe
	initial_roles = list(
		MF_ROLE_FILESERVER,
		MF_ROLE_EMAIL_SERVER,
		MF_ROLE_LOG_SERVER,
		MF_ROLE_CREW_RECORDS,
		MF_ROLE_SOFTWARE)

/obj/machinery/network/mainframe/files
	initial_roles = list(MF_ROLE_FILESERVER)

/obj/machinery/network/mainframe/email
	initial_roles = list(MF_ROLE_EMAIL_SERVER)

/obj/machinery/network/mainframe/logs
	initial_roles = list(MF_ROLE_LOG_SERVER)

/obj/machinery/network/mainframe/records
	initial_roles = list(MF_ROLE_CREW_RECORDS)

/obj/machinery/network/mainframe/software
	initial_roles = list(MF_ROLE_SOFTWARE)

//supermatterrrr

/obj/machinery/power/supermatter
	name = "energy crystal"
	desc = "A strangely translucent and iridescent crystal, formerly knows as \"Supermatter\""
	radiation_release_modifier = 0
	config_hallucination_power = 0
	light_outer_range = 6

//prefilled fabs

/obj/machinery/fabricator
	var/prefilled = FALSE

/obj/machinery/fabricator/Initialize()
	if(prefilled)
		for(var/matz in base_storage_capacity)
			stored_material[matz] = base_storage_capacity[matz]
	. = ..()

/obj/machinery/fabricator/filled
	prefilled = TRUE

/obj/machinery/fabricator/micro/filled
	prefilled = TRUE

/obj/machinery/fabricator/book/filled
	prefilled = TRUE

/obj/machinery/fabricator/imprinter/filled
	prefilled = TRUE

/obj/machinery/fabricator/industrial/filled
	prefilled = TRUE

/obj/machinery/fabricator/pipe/filled
	prefilled = TRUE

/obj/machinery/fabricator/protolathe/filled
	prefilled = TRUE

/obj/machinery/fabricator/robotics/filled
	prefilled = TRUE

/obj/machinery/fabricator/textile/filled
	prefilled = TRUE

//pdas

/obj/item/modular_computer/pda
	icon = 'maps/tokinori/media/sturdy_pda.dmi'
	default_hardware = list(
		/obj/item/stock_parts/computer/network_card,
		/obj/item/stock_parts/computer/hard_drive/small,
		/obj/item/stock_parts/computer/processor_unit/small,
		/obj/item/stock_parts/computer/card_slot/broadcaster,
		/obj/item/stock_parts/computer/charge_stick_slot/broadcaster,
		/obj/item/stock_parts/computer/battery_module,
		/obj/item/stock_parts/computer/drive_slot)

/obj/item/modular_computer/pda/on_update_icon()
	cut_overlays()
	var/datum/extension/interactive/ntos/os = get_extension(src, /datum/extension/interactive/ntos)
	if(os?.get_screen_overlay())
		var/image/I = image(icon,"[icon_state]-screen")
		I.plane     = EFFECTS_ABOVE_LIGHTING_PLANE
		I.layer     = EYE_GLOW_LAYER
	update_lighting()