/mob/living/ghost()
	set category = "OOC"
	set name = "Ghost"
	set desc = "Relinquish your life and enter the land of the dead."

	if(stat == DEAD || istype(loc, /obj/machinery/cryopod))
		announce_ghost_joinleave(ghostize(1))
	else
		succumb()
