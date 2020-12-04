//TINS (TINS Is Not Singularity)

/*

Theta-integrated neutrino separator (name of the whole assembly, not the generator)

How it works:
1) You open a wormhole (breach) to another dimension
2) Wormhole emits something -> you collect it to gain power
3) Containment field fails
4) ???
5) Everyone dies

*/

#define WPOWER_ICON_PATH 'starlight/icons/wormhole_power.dmi'

#define WORMHOLE_ENERGY_SAFE      10
#define WORMHOLE_ENERGY_TRANSPORT 18
#define WORMHOLE_ENERGY_DANGER    20

/obj/wormhole
	name = "interdimensional wormhole"
	desc = "No regrets, Mr. Freeman."

	icon = WPOWER_ICON_PATH
	icon_state = "wormhole"

	anchored = 1
	density  = 1

	var/energy       = 0 //Coeff of dimensional fracture, if you want to travel through it you need someone to operate it
	var/energy_decay = 1.2
	var/obj/wormhole/exit

/obj/machinery/power/wormhole_gen
	name = "wormhole generator"
	desc = "Wow."

	icon = WPOWER_ICON_PATH
	icon_state = "generator"

	anchored = 1
	density  = 1

	use_power          = POWER_USE_IDLE
	active_power_usage = 15 KILOWATTS

	var/obj/wormhole/generated
	var/power_setting = 0

/obj/machinery/power/wormhole_gen/Process()
	if(use_power != POWER_USE_ACTIVE || !powered())
		icon_state = initial(icon_state)
		if(generated) failure()
		return

	if(!generated) generated = new()

	icon_state = "generator-work"
	generated.loc = get_step(src,dir)
	generated.energy += power_setting

	change_power_consumption(initial(active_power_usage) + (power_setting * 2 KILOWATTS), use_power_mode = POWER_USE_ACTIVE)

	if(prob(5 * power_setting)) playsound(src, 'sound/machines/disperser_fire.ogg', rand(5,10) * power_setting, 0)

/obj/machinery/power/wormhole_gen/proc/failure()
	qdel(generated)
	visible_message(SPAN_DANGER("\the [name] shuts down!"))

/obj/machinery/computer/wormhole
	name = "wormhole generator console"
	icon_keyboard = "id_key"
	icon_screen   = "telesci"
	light_color   = COLOR_PINK

/obj/machinery/computer/fusion/ui_interact(var/mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	ui = SSnano.try_update_ui(user, src, ui_key, ui, build_ui_data(), force_open)
	if(!ui)
		ui = new(user, src, ui_key, "wormhole.tmpl", name, 400, 600)
		ui.set_initial_data(build_ui_data())
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/computer/wormhole/OnTopic(var/mob/user, var/href_list, var/datum/topic_state/state)
	. = TOPIC_REFRESH
	var/obj/machinery/power/wormhole_gen/W = locate() in get_area()
	if(!W) return
	if(href_list["toggle"])
		W.update_use_power(W.use_power == POWER_USE_ACTIVE ? POWER_USE_IDLE : POWER_USE_ACTIVE)
	if(href_list["set_power"])
		W.power_setting = clamp((input("New containment power value", "Wormhole Control", W.power_setting) as num),-5,5)

/obj/machinery/computer/wormhole/proc/build_ui_data()
	. = list()
	var/obj/machinery/power/wormhole_gen/W = locate() in get_area()
	if(!W)
		.["status"]   = "N/A"
		.["power"]    = "N/A"
		.["wormhole"] = "N/A"
		return
	.["status"]   = W.powered()
	.["power"]    = W.power_setting
	.["wormhole"] = W.generated ? W.generated.energy : "N/A"