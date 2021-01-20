/obj/machinery/door/airlock/hatch/labyrinth/Initialize()
	. = ..()
	var/obj/effect/floor_decal/industrial/hatch/yellow/decal
	var/obj/machinery/door/firedoor/fire
	if(!(locate(decal) in loc)) decal = new(loc)
	if(!(locate(fire)  in loc)) fire  = new(loc)
	var/area/A = get_area(src)
	SetName("hatch ([A.name])")

/obj/machinery/door/airlock/hatch/labyrinth/eng
	stripe_color = COLOR_WARM_YELLOW

/obj/machinery/door/airlock/hatch/labyrinth/med
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/hatch/labyrinth/com
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/hatch/labyrinth/sci
	stripe_color = COLOR_RESEARCH
