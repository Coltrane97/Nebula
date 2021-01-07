//timesavers!

/obj/effect/wallframe_spawn/activate()
	. = ..()
	var/obj/machinery/door/firedoor/fire = locate() in loc
	if(!fire) fire = new(loc)

/obj/machinery/door/airlock/Initialize()
	. = ..()
	if(istype(src,/obj/machinery/door/airlock/external) || istype(src,/obj/machinery/door/airlock/multi_tile)) return
	var/obj/machinery/door/firedoor/fire = locate() in loc
	if(!fire) fire = new(loc)

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