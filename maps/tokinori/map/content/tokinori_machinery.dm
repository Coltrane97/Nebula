/obj/machinery/alarm/heavy
	name               = "mounted life support system"
	desc               = "Wall-mounted life support system. Can directly recycle CO2 to O2 and regulate temperature."
	icon               = 'maps/tokinori/media/life_support.dmi'
	idle_power_usage   = 1  KILOWATTS
	active_power_usage = 30 KILOWATTS
	base_type          = /obj/machinery/alarm/heavy

//pretty much copy from oxyregen but still works
/obj/machinery/alarm/heavy/handle_heating_cooling(var/datum/gas_mixture/environment)
	..()
	if(!environment.gas[/decl/material/gas/carbon_dioxide]) return
	var/intake = between(0, environment.gas[/decl/material/gas/carbon_dioxide], 400)
	environment.adjust_gas(/decl/material/gas/carbon_dioxide, -intake, 1) //suck CO2
	var/datum/gas_mixture/oxygen = new
	oxygen.adjust_gas(/decl/material/gas/oxygen, intake)
	oxygen.temperature = T0C
	environment.merge(oxygen)
	use_power_oneoff(5 KILOWATTS)
	if(prob(5)) playsound(src, 'sound/machines/pump.ogg', 25, 0)

/obj/item/stock_parts/circuitboard/air_alarm/heavy
	name           = T_BOARD("mounted life support system")
	build_path     = /obj/machinery/alarm/heavy
	req_components = list(/obj/item/stock_parts/micro_laser = 2, /obj/item/stock_parts/capacitor = 1)

/obj/item/frame/air_alarm/heavy
	name = "life support system frame"
	desc = "Used for building mounted life support system."
	build_machine_type = /obj/machinery/alarm/heavy

/obj/item/frame/air_alarm/heavy/kit
	name = "life support system kit"
	desc = "Prefabricated kit for mounted life support system."
	fully_construct = TRUE

/datum/stack_recipe/air_alarm/heavy
	title = "life support system frame"
	result_type = /obj/item/frame/air_alarm/heavy

//lathe

/datum/fabricator_recipe/engineering/airalarm/heavy
	path = /obj/item/stock_parts/circuitboard/air_alarm/heavy

/datum/fabricator_recipe/engineering/airalarm_kit/heavy
	path = /obj/item/frame/air_alarm/heavy/kit