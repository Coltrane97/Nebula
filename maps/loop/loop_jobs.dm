/datum/map/loop
	allowed_jobs = list(/datum/job/assistant,/datum/job/assistant/head)

/datum/spawnpoint/cryo
	display_name = "Cryogenic Storage"
	msg = "has completed revival in the cryogenics bay"
	disallow_job = list("Robot")

/datum/job/assistant
	title = "Loop Dweller"
	supervisors = "the Captain"
	total_positions = 7
	spawn_positions = 7

	outfit_type = /decl/hierarchy/outfit/job/loop
	selection_color = "#704a36"
	department_refs = list(DEPT_ENGINEERING)
	hud_icon = "hudengineer"

	max_skill = list(
		SKILL_LITERACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_MEDICAL = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)

	skill_points = 36

	alt_titles = list(
		"Engineer" = /decl/hierarchy/outfit/job/loop/engineer, \
		"Doctor" = /decl/hierarchy/outfit/job/loop/doctor
		)

/datum/job/assistant/head
	title = "Captain"
	supervisors = "your command"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#4824a3"
	hud_icon = "hudcaptain"
	alt_titles = list()

//Outfits

/decl/hierarchy/outfit/job/loop
	name = "\"The Loop\" Complex - Standard Uniform"
	uniform = /obj/item/clothing/under/color/white
	shoes = /obj/item/clothing/shoes/color/white
	id_type = /obj/item/card/id/civilian
	id_slot = slot_wear_id_str
	l_ear = null
	pda_type = null

/decl/hierarchy/outfit/job/loop/engineer
	name = "\"The Loop\" Complex - Engineering Uniform"
	uniform = /obj/item/clothing/under/hazard
	shoes = /obj/item/clothing/shoes/workboots
	belt = /obj/item/storage/belt/utility/full

/decl/hierarchy/outfit/job/loop/doctor
	name = "\"The Loop\" Complex - Medical Uniform"
	uniform = /obj/item/clothing/under/sterile
	shoes = /obj/item/clothing/shoes/color/white
	l_pocket = /obj/item/scanner/health
