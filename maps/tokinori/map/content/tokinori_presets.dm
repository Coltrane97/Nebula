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