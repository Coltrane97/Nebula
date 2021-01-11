var/list/mapkeys = list(
	"#" = /turf/simulated/wall/r_wall/prepainted,
	"." = /turf/simulated/floor/plating,
	"/" = /obj/machinery/door/airlock
	)


/datum/map_gen
	var/grid = ""

/datum/map_gen/New()
	grid