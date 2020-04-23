/obj/item/stock_parts/circuitboard/mainframe
	name = T_BOARD("mainframe")
	build_path = /obj/machinery/network/mainframe
	board_type = "machine"
	origin_tech = "{'programming':2}"
	req_components = list()
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/computer/hard_drive/cluster/fullhouse
	)

/obj/item/stock_parts/circuitboard/router
	name = T_BOARD("router")
	build_path = /obj/machinery/network/router
	board_type = "machine"
	origin_tech = "{'bluespace':2,'programming':2}"
	req_components = list(
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/crystal = 1
	)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1
	)