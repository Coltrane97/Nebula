/decl/hierarchy/outfit/job/labyrinth/basic/researcher
	name = "Facility Researcher Outfit"
	id_type = /obj/item/card/id/science
	shoes = /obj/item/clothing/shoes/dress
	pda_type = /obj/item/modular_computer/pda/science

/obj/item/card/id/science
	name = "identification card"
	desc = "A card issued to science staff."
	job_access_type = /datum/job/researcher
	detail_color = COLOR_PALE_PURPLE_GRAY

/decl/hierarchy/outfit/job/labyrinth/basic/researcher/head
	name = "Facility Head Researcher Outfit"
	id_type = /obj/item/card/id/science/head

/obj/item/card/id/science/head
	name = "identification card"
	desc = "A card which represents knowledge and reasoning."
	job_access_type = /datum/job/researcher/head
	extra_details = list("goldstripe")
