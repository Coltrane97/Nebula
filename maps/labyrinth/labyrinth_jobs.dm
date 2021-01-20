/datum/map/labyrinth
	default_law_type = /datum/ai_laws/asimov
	default_assistant_title = "Facility Member"
	allowed_jobs = list(
		/datum/job/assistant,
		/datum/job/director,
		/datum/job/manager,
		/datum/job/engineer/head,
		/datum/job/engineer,
		/datum/job/doctor/head,
		/datum/job/doctor,
		/datum/job/researcher/head,
		/datum/job/researcher
	)

#define HUMAN_ONLY_JOBS /datum/job/director, /datum/job/manager, /datum/job/engineer/head, /datum/job/researcher/head, /datum/job/doctor/head

/datum/map/labyrinth
	species_to_job_blacklist = list(
		/decl/species/corvid = list(HUMAN_ONLY_JOBS),
		/decl/species/utility_frame = list(HUMAN_ONLY_JOBS)
	)

#undef HUMAN_ONLY_JOBS

/obj/machinery/suit_cycler/labyrinth
	helmet = /obj/item/clothing/head/helmet/space/void/engineering
	suit   = /obj/item/clothing/suit/space/void/engineering
	boots  = /obj/item/clothing/shoes/magboots
	initial_access = list()

/obj/machinery/suit_cycler/labyrinth/salvage
	helmet = /obj/item/clothing/head/helmet/space/void/engineering/salvage
	suit   = /obj/item/clothing/suit/space/void/engineering/salvage
