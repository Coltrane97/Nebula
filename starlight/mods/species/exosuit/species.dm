/decl/species/utility_frame/exosuit
	name         = SPECIES_EXOSUIT
	name_plural  = "Exosuit Frames"
	description  = "Human-driven robots designed for dangerous tasks."

	icobase      = 'starlight/mods/species/exosuit/icons/body.dmi'
	deform       = 'starlight/mods/species/exosuit/icons/body.dmi'
	preview_icon = 'starlight/mods/species/exosuit/icons/preview.dmi'

	spawn_flags = 0
	strength    = STR_VHIGH
	warning_low_pressure = -1
	hazard_low_pressure  = -1
	passive_temp_gain    = -10
	brute_mod = 0.1
	burn_mod  = 0.1
	siemens_coefficient = 0

	genders   = list(MALE)
	has_organ = list(BP_EYES = /obj/item/organ/internal/eyes/robot)

/datum/fabricator_recipe/industrial/exosuit/species
	name      = "exosuit deployment"
	category  = "Exosuit Deploys"
	resources = list(
		/decl/material/solid/metal/steel     = MATTER_AMOUNT_PRIMARY * 6,
		/decl/material/solid/metal/osmium    = MATTER_AMOUNT_PRIMARY * 6,
		/decl/material/solid/metal/aluminium = MATTER_AMOUNT_PRIMARY * 2,
		/decl/material/solid/plastic         = MATTER_AMOUNT_REINFORCEMENT
	)

/datum/fabricator_recipe/industrial/exosuit/species/build(var/turf/location, var/amount = 1)
	. = list()
	for(var/i = 1, i <= amount, i++)
		. += new /mob/living/carbon/human/exosuit(location)

//premade

/mob/living/carbon/human/exosuit/Initialize(mapload)
	. = ..(mapload, SPECIES_EXOSUIT)

//enter-exit plus air

/mob/living/carbon/human/Initialize()
	. = ..()
	if(species.name != SPECIES_EXOSUIT)
		verbs -= /mob/living/carbon/human/verb/get_in
		verbs -= /mob/living/carbon/human/verb/get_out
	else
		teleop = 1

/mob/living/carbon/human/verb/get_in()
	set name     = "Get In"
	set category = "Object"
	set src in range(1)
	var/mob/living/carbon/human/H = usr
	if(!istype(H) || H.incapacitated() || !do_after(H,20,src,TRUE) || (locate(/mob/living/carbon/human) in src)) return
	H.forceMove(src)
	H.teleop = 1
	teleop   = 0
	H.mind.transfer_to(src)

/mob/living/carbon/human/verb/get_out()
	set name     = "Get Out"
	set category = "Object"
	var/mob/living/carbon/human/H = locate() in src
	if(!istype(H) || !do_after(H,20,src,TRUE)) return
	H.forceMove(get_turf(src))
	H.teleop = 0
	teleop   = 1
	mind.transfer_to(H)