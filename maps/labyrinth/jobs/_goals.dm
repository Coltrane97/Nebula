/datum/department/command
	goals = list(/datum/goal/department/paperwork/labyrinth)

var/list/labyrinth_paperwork_spawn_turfs = list()
var/list/labyrinth_paperwork_end_areas = list()

/obj/effect/landmark/paperwork_spawn_labyrinth
	name = "Labyrinth Paperwork Goal Spawn Point"

/obj/effect/landmark/paperwork_spawn_labyrinth/Initialize()
	..()
	var/turf/T = get_turf(src)
	if(istype(T))
		global.labyrinth_paperwork_spawn_turfs |= T
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/paperwork_finish_labyrinth
	name = "Labyrinth Paperwork Goal Finish Point"

/obj/effect/landmark/paperwork_finish_labyrinth/Initialize()
	..()
	var/turf/T = get_turf(src)
	if(istype(T))
		var/area/A = get_area(T)
		if(istype(A))
			global.labyrinth_paperwork_end_areas |= A
	return INITIALIZE_HINT_QDEL

/datum/goal/department/paperwork/labyrinth
	paperwork_types =    list(/obj/item/paperwork/labyrinth)
	signatory_job_list = list(/datum/job/director, /datum/job/manager)

/datum/goal/department/paperwork/labyrinth/get_spawn_turfs()
	return global.labyrinth_paperwork_spawn_turfs

/datum/goal/department/paperwork/labyrinth/get_end_areas()
	return global.labyrinth_paperwork_end_areas

/obj/item/paperwork/labyrinth
	name = "\improper Labyrinth payroll paperwork"
	desc = "A complex list of salaries, hours and tax withheld for Labyrinth workers this month."
