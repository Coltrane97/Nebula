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
/atom/proc/walldir(var/bake = TRUE, var/reverse = FALSE, var/offset = FALSE)

	for(var/face in GLOB.cardinal)
		var/turf/T = get_step(src,face)
		if(T?.density)
			. = (reverse ? GLOB.reverse_dir[face] : face)
			break

	if(bake && (. in GLOB.cardinal)) dir = .

	if(offset)
		offset = (offset == TRUE ? 24 : offset)
		if(. == SOUTH)
			pixel_y = -24
		else if(. == NORTH)
			pixel_y = 24
		else if(. == EAST)
			pixel_x = 24
		else if(. == WEST)
			pixel_x = -24

	update_icon()

/obj/machinery/light/Initialize()
	walldir(bake = TRUE)
	. = ..()

/obj/machinery/power/apc/Initialize()
	walldir(bake = TRUE)
	. = ..()

/obj/machinery/alarm/Initialize()
	walldir(bake = TRUE, reverse = TRUE)
	. = ..()

/obj/machinery/firealarm/Initialize()
	walldir(bake = TRUE)
	. = ..()

/obj/structure/extinguisher_cabinet/Initialize()
	walldir(bake = TRUE,   offset = 32)
	. = ..()

/obj/machinery/light_switch/Initialize()
	walldir(bake = FALSE,  offset = TRUE)
	. = ..()

//autonames

/obj/machinery/door/airlock/Initialize()
	if(!istype(src,/obj/machinery/door/airlock/external))
		var/area/A = get_area(src)
		name = "hatch ([A.name])"
	. = ..()

//airlock helper

/obj/machinery/door/airlock/hatch //i think only it is will be used since MOOOOD
	icon       = 'maps/tokinori/media/helpers.dmi'
	icon_state = "door"

/obj/machinery/door/airlock/hatch/Initialize()
	icon = 'icons/obj/doors/hatch/door.dmi'
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
	desc = "A strangely translucent and iridescent crystal, formerly known as the \"Supermatter\""
	radiation_release_modifier = 0
	config_hallucination_power = 0
	light_outer_range = 6

//prefilled fabs

/obj/machinery/fabricator
	var/prefilled = FALSE

/obj/machinery/fabricator/Initialize()
	. = ..()
	if(prefilled)
		stored_material = list()
		for(var/mat in storage_capacity) stored_material[mat] = storage_capacity[mat]

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

//designs

/obj/item/gun/projectile/pistol/fabricated
	name           = "fabricated pistol"
	desc           = "Cheap, fresh, from-the-line fabricated weapon. Loves to jam."
	magazine_type  = null
	jam_chance     = 5
	origin_tech    = "{'combat':1,'materials':1}"

/datum/fabricator_recipe/textiles/gun
	path = /obj/item/gun/projectile/pistol/fabricated