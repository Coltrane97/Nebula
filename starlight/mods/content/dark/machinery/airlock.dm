/obj/machinery/door/airlock
    autoclose = 0

/obj/machinery/door/airlock/Bumped(atom/AM)
	if(panel_open || operating) return
	if(ismob(AM))
		var/mob/M = AM
		if(world.time - M.last_bumped <= 10) return	//Can bump-open one airlock per second. This is to prevent shock spam.
		M.last_bumped = world.time
		if(!M.restrained() && (!issmall(M) || ishuman(M) || issilicon(M)))
			do_animate("deny")
		return