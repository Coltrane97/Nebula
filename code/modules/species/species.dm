/*
	Datum-based species. Should make for much cleaner and easier to maintain race code.
*/

/decl/species

	// Descriptors and strings.
	var/name
	var/name_plural                                      // Pluralized name (since "[name]s" is not always valid)
	var/description
	var/codex_description
	var/ooc_codex_information
	var/cyborg_noun = "Cyborg"
	var/hidden_from_codex = TRUE
	var/is_crystalline = FALSE

	// Icon/appearance vars.
	var/icobase =      'icons/mob/human_races/species/human/body.dmi'          // Normal icon set.
	var/deform =       'icons/mob/human_races/species/human/deformed_body.dmi' // Mutated icon set.
	var/preview_icon = 'icons/mob/human_races/species/human/preview.dmi'
	var/lip_icon =     'icons/mob/human_races/species/human/lips.dmi'
	var/husk_icon =    'icons/mob/human_races/species/default_husk.dmi'
	var/bandages_icon
	var/bodytype = BODYTYPE_OTHER
	var/limb_icon_intensity = 1.5

	// Damage overlay and masks.
	var/damage_overlays = 'icons/mob/human_races/species/human/damage_overlay.dmi'
	var/damage_mask =     'icons/mob/human_races/species/human/damage_mask.dmi'
	var/blood_mask =      'icons/mob/human_races/species/human/blood_mask.dmi'

	var/blood_color = COLOR_BLOOD_HUMAN               // Red.
	var/flesh_color = "#ffc896"               // Pink.
	var/blood_oxy = 1
	var/base_color                            // Used by changelings. Should also be used for icon previes..
	var/limb_blend = ICON_ADD
	var/tail                                  // Name of tail state in species effects icon file.
	var/tail_animation                        // If set, the icon to obtain tail animation states from.
	var/tail_blend = ICON_ADD
	var/tail_hair
	var/tail_icon = 'icons/effects/species.dmi'
	var/tail_states = 1

	var/list/hair_styles
	var/list/facial_hair_styles

	var/organs_icon		//species specific internal organs icons

	var/default_h_style = "Bald"
	var/default_f_style = "Shaved"

	var/icon_cache_uid                        // Used for mob icon cache string.
	var/icon_template = 'icons/mob/human_races/species/template.dmi' // Used for mob icon generation for non-32x32 species.
	var/pixel_offset_x = 0                    // Used for offsetting large icons.
	var/pixel_offset_y = 0                    // Used for offsetting large icons.
	var/pixel_offset_z = 0                    // Used for offsetting large icons.
	var/antaghud_offset_x = 0                 // As above, but specifically for the antagHUD indicator.
	var/antaghud_offset_y = 0                 // As above, but specifically for the antagHUD indicator.

	var/mob_size	= MOB_SIZE_MEDIUM
	var/strength    = STR_MEDIUM
	var/show_ssd = "fast asleep"
	var/short_sighted                         // Permanent weldervision.
	var/light_sensitive                       // Ditto, but requires sunglasses to fix
	var/blood_volume = SPECIES_BLOOD_DEFAULT  // Initial blood volume.
	var/hunger_factor = DEFAULT_HUNGER_FACTOR // Multiplier for hunger.
	var/thirst_factor = DEFAULT_THIRST_FACTOR // Multiplier for thirst.
	var/taste_sensitivity = TASTE_NORMAL      // How sensitive the species is to minute tastes.
	var/silent_steps

	var/min_age = 17
	var/max_age = 70

	// Speech vars.
	var/assisted_langs = list()               // The languages the species can't speak without an assisted organ.
	var/list/speech_sounds                    // A list of sounds to potentially play when speaking.
	var/list/speech_chance                    // The likelihood of a speech sound playing.

	// Combat vars.
	var/total_health = 200                   // Point at which the mob will enter crit.
	var/list/unarmed_attacks = list(           // Possible unarmed attacks that the mob will use in combat,
		/decl/natural_attack,
		/decl/natural_attack/bite
		)

	var/list/natural_armour_values            // Armour values used if naked.
	var/brute_mod =      1                    // Physical damage multiplier.
	var/burn_mod =       1                    // Burn damage multiplier.
	var/toxins_mod =     1                    // Toxloss modifier
	var/radiation_mod =  1                    // Radiation modifier

	var/oxy_mod =        1                    // Oxyloss modifier
	var/flash_mod =      1                    // Stun from blindness modifier.
	var/metabolism_mod = 1                    // Reagent metabolism modifier
	var/stun_mod =       1                    // Stun period modifier.
	var/paralysis_mod =  1                    // Paralysis period modifier.
	var/weaken_mod =     1                    // Weaken period modifier.

	var/vision_flags = SEE_SELF               // Same flags as glasses.

	// Death vars.
	var/meat_type =     /obj/item/chems/food/snacks/meat/human
	var/meat_amount =   3
	var/skin_material = /decl/material/solid/skin
	var/skin_amount =   3
	var/bone_material = /decl/material/solid/bone
	var/bone_amount =   3
	var/remains_type =  /obj/item/remains/xeno
	var/gibbed_anim =   "gibbed-h"
	var/dusted_anim =   "dust-h"

	var/death_sound
	var/death_message = "seizes up and falls limp, their eyes dead and lifeless..."
	var/knockout_message = "collapses, having been knocked unconscious."
	var/halloss_message = "slumps over, too weak to continue fighting..."
	var/halloss_message_self = "The pain is too severe for you to keep going..."

	var/sniff_message_3p = "sniffs the air."
	var/sniff_message_1p = "You sniff the air."

	var/limbs_are_nonsolid
	var/spawns_with_stack = 0
	// Environment tolerance/life processes vars.
	var/reagent_tag                                             // Used for metabolizing reagents.
	var/breath_pressure = 16                                    // Minimum partial pressure safe for breathing, kPa
	var/breath_type = /decl/material/gas/oxygen                                  // Non-oxygen gas breathed, if any.
	var/poison_types = list(/decl/material/gas/chlorine = TRUE) // Noticeably poisonous air - ie. updates the toxins indicator on the HUD.
	var/exhale_type = /decl/material/gas/carbon_dioxide                          // Exhaled gas type.
	var/blood_reagent = /decl/material/liquid/blood

	var/max_pressure_diff = 60                                  // Maximum pressure difference that is safe for lungs
	var/cold_level_1 = 243                                      // Cold damage level 1 below this point. -30 Celsium degrees
	var/cold_level_2 = 200                                      // Cold damage level 2 below this point.
	var/cold_level_3 = 120                                      // Cold damage level 3 below this point.
	var/heat_level_1 = 360                                      // Heat damage level 1 above this point.
	var/heat_level_2 = 400                                      // Heat damage level 2 above this point.
	var/heat_level_3 = 1000                                     // Heat damage level 3 above this point.
	var/passive_temp_gain = 0		                            // Species will gain this much temperature every second
	var/hazard_high_pressure = HAZARD_HIGH_PRESSURE             // Dangerously high pressure.
	var/warning_high_pressure = WARNING_HIGH_PRESSURE           // High pressure warning.
	var/warning_low_pressure = WARNING_LOW_PRESSURE             // Low pressure warning.
	var/hazard_low_pressure = HAZARD_LOW_PRESSURE               // Dangerously low pressure.
	var/body_temperature = 310.15	                            // Species will try to stabilize at this temperature.
	                                                            // (also affects temperature processing)
	var/heat_discomfort_level = 315                             // Aesthetic messages about feeling warm.
	var/cold_discomfort_level = 285                             // Aesthetic messages about feeling chilly.
	var/list/heat_discomfort_strings = list(
		"You feel sweat drip down your neck.",
		"You feel uncomfortably warm.",
		"Your skin prickles in the heat."
		)
	var/list/cold_discomfort_strings = list(
		"You feel chilly.",
		"You shiver suddenly.",
		"Your chilly flesh stands out in goosebumps."
		)

	var/water_soothe_amount

	// HUD data vars.
	var/datum/hud_data/hud
	var/hud_type
	var/health_hud_intensity = 1

	var/grab_type = /decl/grab/normal/passive // The species' default grab type.

	// Body/form vars.
	var/list/inherent_verbs 	  // Species-specific verbs.
	var/siemens_coefficient = 1   // The lower, the thicker the skin and better the insulation.
	var/darksight_range = 2       // Native darksight distance.
	var/darksight_tint = DARKTINT_NONE // How shadows are tinted.
	var/species_flags = 0         // Various specific features.
	var/appearance_flags = 0      // Appearance/display related features.
	var/spawn_flags = 0           // Flags that specify who can spawn as this species
	var/slowdown = 0              // Passive movement speed malus (or boost, if negative)
	// Move intents. Earlier in list == default for that type of movement.
	var/list/move_intents = list(/decl/move_intent/walk, /decl/move_intent/run, /decl/move_intent/creep)

	var/primitive_form            // Lesser form, if any (ie. monkey for humans)
	var/greater_form              // Greater form, if any, ie. human for monkeys.
	var/holder_type
	var/gluttonous = 0            // Can eat some mobs. Values can be GLUT_TINY, GLUT_SMALLER, GLUT_ANYTHING, GLUT_ITEM_TINY, GLUT_ITEM_NORMAL, GLUT_ITEM_ANYTHING, GLUT_PROJECTILE_VOMIT
	var/stomach_capacity = 5      // How much stuff they can stick in their stomach
	var/rarity_value = 1          // Relative rarity/collector value for this species.
	                              // Determines the organs that the species spawns with and
	var/list/has_organ = list(    // which required-organ checks are conducted.
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_APPENDIX = /obj/item/organ/internal/appendix,
		BP_EYES =     /obj/item/organ/internal/eyes
		)
	var/vision_organ              // If set, this organ is required for vision. Defaults to "eyes" if the species has them.
	var/breathing_organ           // If set, this organ is required for breathing. Defaults to "lungs" if the species has them.

	var/list/override_organ_types // Used for species that only need to change one or two entries in has_organ.

	var/obj/effect/decal/cleanable/blood/tracks/move_trail = /obj/effect/decal/cleanable/blood/tracks/footprints // What marks are left when walking

	var/list/skin_overlays = list()

	// An associative list of target zones (ex. BP_CHEST, BP_MOUTH) mapped to all possible keys associated
	// with the zone. Unused on vanilla Nebula at time of commit, will be used by hands and inventory 
	// rewrite and for species with body layouts that do not map directly to the standard humanoid body.
	var/list/limb_mapping 

	var/list/has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
	)

	var/list/override_limb_types // Used for species that only need to change one or two entries in has_limbs.

	// The basic skin colours this species uses
	var/list/base_skin_colours

	var/list/genders = list(MALE, FEMALE, PLURAL)

	// Bump vars
	var/bump_flag = HUMAN	// What are we considered to be when bumped?
	var/push_flags = ~HEAVY	// What can we push?
	var/swap_flags = ~HEAVY	// What can we swap place with?

	var/pass_flags = 0
	var/breathing_sound = 'sound/voice/monkey.ogg'
	var/list/equip_adjust = list()
	var/list/equip_overlays = list()

	var/list/base_auras

	var/sexybits_location	//organ tag where they are located if they can be kicked for increased pain

	var/list/prone_overlay_offset = list(0, 0) // amount to shift overlays when lying
	var/job_skill_buffs = list()				// A list containing jobs (/datum/job), with values the extra points that job recieves.

	var/list/descriptors = list(
		/datum/mob_descriptor/height = 0,
		/datum/mob_descriptor/build = 0
	)

	var/standing_jump_range = 2
	var/list/maneuvers = list(/decl/maneuver/leap)

	var/list/available_cultural_info = list(
		TAG_CULTURE =   list(CULTURE_OTHER),
		TAG_HOMEWORLD = list(HOME_SYSTEM_STATELESS),
		TAG_FACTION =   list(FACTION_OTHER),
		TAG_RELIGION =  list(RELIGION_OTHER)
	)
	var/list/force_cultural_info =                list()
	var/list/default_cultural_info =              list()
	var/list/additional_available_cultural_info = list()
	var/max_players

	// Order matters, higher pain level should be higher up
	var/list/pain_emotes_with_pain_level = list(
		list(/decl/emote/audible/scream, /decl/emote/audible/whimper, /decl/emote/audible/moan, /decl/emote/audible/cry) = 70,
		list(/decl/emote/audible/grunt, /decl/emote/audible/groan, /decl/emote/audible/moan) = 40,
		list(/decl/emote/audible/grunt, /decl/emote/audible/groan) = 10,
	)

	var/manual_dexterity = DEXTERITY_FULL

	var/datum/ai/ai						// Type abused. Define with path and will automagically create. Determines behaviour for clientless mobs. This will override mob AIs.

	var/exertion_effect_chance = 0
	var/exertion_hydration_scale = 0
	var/exertion_nutrition_scale = 0
	var/exertion_charge_scale = 0
	var/exertion_reagent_scale = 0
	var/exertion_reagent_path = null
	var/list/exertion_emotes_biological = null
	var/list/exertion_emotes_synthetic = null
/*
These are all the things that can be adjusted for equipping stuff and
each one can be in the NORTH, SOUTH, EAST, and WEST direction. Specify
the direction to shift the thing and what direction.

example:
	equip_adjust = list(
		slot_back_str = list(NORTH = list(SOUTH = 12, EAST = 7), EAST = list(SOUTH = 2, WEST = 12))
			)

This would shift back items (backpacks, axes, etc.) when the mob
is facing either north or east.
When the mob faces north the back item icon is shifted 12 pixes down and 7 pixels to the right.
When the mob faces east the back item icon is shifted 2 pixels down and 12 pixels to the left.

The slots that you can use are found in items_clothing.dm and are the inventory slot string ones, so make sure
	you use the _str version of the slot.
*/

/decl/species/New()

	if(!codex_description)
		codex_description = description

	for(var/token in ALL_CULTURAL_TAGS)

		var/force_val = force_cultural_info[token]
		if(force_val)
			default_cultural_info[token] = force_val
			available_cultural_info[token] = list(force_val)

		else if(additional_available_cultural_info[token])
			if(!available_cultural_info[token])
				available_cultural_info[token] = list()
			available_cultural_info[token] |= additional_available_cultural_info[token]

		else if(!LAZYLEN(available_cultural_info[token]))
			var/list/map_systems = GLOB.using_map.available_cultural_info[token]
			available_cultural_info[token] = map_systems.Copy()

		if(LAZYLEN(available_cultural_info[token]) && !default_cultural_info[token])
			var/list/avail_systems = available_cultural_info[token]
			default_cultural_info[token] = avail_systems[1]

		if(!default_cultural_info[token])
			default_cultural_info[token] = GLOB.using_map.default_cultural_info[token]

	if(hud_type)
		hud = new hud_type()
	else
		hud = new()

	if(LAZYLEN(descriptors))
		var/list/descriptor_datums = list()
		for(var/desctype in descriptors)
			var/datum/mob_descriptor/descriptor = new desctype
			descriptor.comparison_offset = descriptors[desctype]
			descriptor_datums[descriptor.name] = descriptor
		descriptors = descriptor_datums

	//If the species has eyes, they are the default vision organ
	if(!vision_organ && has_organ[BP_EYES])
		vision_organ = BP_EYES
	//If the species has lungs, they are the default breathing organ
	if(!breathing_organ && has_organ[BP_LUNGS])
		breathing_organ = BP_LUNGS

	// Modify organ lists if necessary.
	if(islist(override_organ_types))
		for(var/ltag in override_organ_types)
			has_organ[ltag] = override_organ_types[ltag]

	if(islist(override_limb_types))
		for(var/ltag in override_limb_types)
			has_limbs[ltag] = list("path" = override_limb_types[ltag])

	//Build organ descriptors
	for(var/limb_type in has_limbs)
		var/list/organ_data = has_limbs[limb_type]
		var/obj/item/organ/limb_path = organ_data["path"]
		organ_data["descriptor"] = initial(limb_path.name)
	
/decl/species/proc/equip_survival_gear(var/mob/living/carbon/human/H,var/extendedtank = 1)
	if(istype(H.get_equipped_item(slot_back_str), /obj/item/storage/backpack))
		if (extendedtank)
			H.equip_to_slot_or_del(new /obj/item/storage/box/engineer(H.back), slot_in_backpack_str)
		else
			H.equip_to_slot_or_del(new /obj/item/storage/box/survival(H.back), slot_in_backpack_str)
	else
		if (extendedtank)
			H.put_in_hands_or_del(new /obj/item/storage/box/engineer(H))
		else
			H.put_in_hands_or_del(new /obj/item/storage/box/survival(H))

/decl/species/proc/get_manual_dexterity(var/mob/living/carbon/human/H)
	. = manual_dexterity

/decl/species/proc/create_organs(var/mob/living/carbon/human/H) //Handles creation of mob organs.

	H.mob_size = mob_size
	for(var/obj/item/organ/organ in H.contents)
		if((organ in H.organs) || (organ in H.internal_organs))
			qdel(organ)

	if(H.organs)                  H.organs.Cut()
	if(H.internal_organs)         H.internal_organs.Cut()
	if(H.organs_by_name)          H.organs_by_name.Cut()
	if(H.internal_organs_by_name) H.internal_organs_by_name.Cut()

	H.organs = list()
	H.internal_organs = list()
	H.organs_by_name = list()
	H.internal_organs_by_name = list()

	for(var/limb_type in has_limbs)
		var/list/organ_data = has_limbs[limb_type]
		var/limb_path = organ_data["path"]
		new limb_path(H)

	for(var/organ_tag in has_organ)
		var/organ_type = has_organ[organ_tag]
		var/obj/item/organ/O = new organ_type(H)
		if(organ_tag != O.organ_tag)
			warning("[O.type] has a default organ tag \"[O.organ_tag]\" that differs from the species' organ tag \"[organ_tag]\". Updating organ_tag to match.")
			O.organ_tag = organ_tag
		H.internal_organs_by_name[organ_tag] = O

	for(var/name in H.organs_by_name)
		H.organs |= H.organs_by_name[name]

	for(var/name in H.internal_organs_by_name)
		H.internal_organs |= H.internal_organs_by_name[name]

	for(var/obj/item/organ/O in (H.organs|H.internal_organs))
		O.owner = H
		post_organ_rejuvenate(O, H)

	H.sync_organ_dna()

/decl/species/proc/hug(var/mob/living/carbon/human/H,var/mob/living/target)

	var/t_him = "them"
	switch(target.gender)
		if(MALE)
			t_him = "him"
		if(FEMALE)
			t_him = "her"

	H.visible_message("<span class='notice'>[H] hugs [target] to make [t_him] feel better!</span>", \
					"<span class='notice'>You hug [target] to make [t_him] feel better!</span>")

	if(H != target)
		H.update_personal_goal(/datum/goal/achievement/givehug, TRUE)
		target.update_personal_goal(/datum/goal/achievement/gethug, TRUE)

/decl/species/proc/add_base_auras(var/mob/living/carbon/human/H)
	if(base_auras)
		for(var/type in base_auras)
			H.add_aura(new type(H))

/decl/species/proc/remove_base_auras(var/mob/living/carbon/human/H)
	if(base_auras)
		var/list/bcopy = base_auras.Copy()
		for(var/a in H.auras)
			var/obj/aura/A = a
			if(is_type_in_list(a, bcopy))
				bcopy -= A.type
				H.remove_aura(A)
				qdel(A)

/decl/species/proc/remove_inherent_verbs(var/mob/living/carbon/human/H)
	if(inherent_verbs)
		for(var/verb_path in inherent_verbs)
			H.verbs -= verb_path
	return

/decl/species/proc/add_inherent_verbs(var/mob/living/carbon/human/H)
	if(inherent_verbs)
		for(var/verb_path in inherent_verbs)
			H.verbs |= verb_path
	return

/decl/species/proc/handle_post_spawn(var/mob/living/carbon/human/H) //Handles anything not already covered by basic species assignment.
	add_inherent_verbs(H)
	add_base_auras(H)
	H.mob_bump_flag = bump_flag
	H.mob_swap_flags = swap_flags
	H.mob_push_flags = push_flags
	H.pass_flags = pass_flags
	handle_limbs_setup(H)

/decl/species/proc/handle_pre_spawn(var/mob/living/carbon/human/H)
	return

/decl/species/proc/handle_death(var/mob/living/carbon/human/H) //Handles any species-specific death events.
	return

/decl/species/proc/handle_new_grab(var/mob/living/carbon/human/H, var/obj/item/grab/G)
	return

/decl/species/proc/handle_sleeping(var/mob/living/carbon/human/H)
	if(prob(2) && !H.failed_last_breath && !H.isSynthetic())
		if(!H.paralysis)
			H.emote("snore")
		else
			H.emote("groan")

/decl/species/proc/handle_environment_special(var/mob/living/carbon/human/H)
	return

/decl/species/proc/handle_movement_delay_special(var/mob/living/carbon/human/H)
	return 0

// Used to update alien icons for aliens.
/decl/species/proc/handle_login_special(var/mob/living/carbon/human/H)
	return

// As above.
/decl/species/proc/handle_logout_special(var/mob/living/carbon/human/H)
	return

// Builds the HUD using species-specific icons and usable slots.
/decl/species/proc/build_hud(var/mob/living/carbon/human/H)
	return

/decl/species/proc/can_understand(var/mob/other)
	return

/decl/species/proc/can_overcome_gravity(var/mob/living/carbon/human/H)
	return FALSE

// Used for any extra behaviour when falling and to see if a species will fall at all.
/decl/species/proc/can_fall(var/mob/living/carbon/human/H)
	return TRUE

// Used to override normal fall behaviour. Use only when the species does fall down a level.
/decl/species/proc/handle_fall_special(var/mob/living/carbon/human/H, var/turf/landing)
	return FALSE

// Called when using the shredding behavior.
/decl/species/proc/can_shred(var/mob/living/carbon/human/H, var/ignore_intent, var/ignore_antag)

	if((!ignore_intent && H.a_intent != I_HURT) || H.pulling_punches)
		return 0

	if(!ignore_antag && H.mind && !player_is_antag(H.mind))
		return 0

	for(var/attack_type in unarmed_attacks)
		var/decl/natural_attack/attack = decls_repository.get_decl(attack_type)
		if(!istype(attack) || !attack.is_usable(H))
			continue
		if(attack.shredding)
			return 1
	return 0

/decl/species/proc/handle_vision(var/mob/living/carbon/human/H)
	var/list/vision = H.get_accumulated_vision_handlers()
	H.update_sight()
	H.set_sight(H.sight|get_vision_flags(H)|H.equipment_vision_flags|vision[1])
	H.change_light_colour(H.getDarkvisionTint())

	if(H.stat == DEAD)
		return 1

	if(!H.drugged)
		H.set_see_in_dark((H.sight == (SEE_TURFS|SEE_MOBS|SEE_OBJS)) ? 8 : min(H.getDarkvisionRange() + H.equipment_darkness_modifier, 8))
		if(H.equipment_see_invis)
			H.set_see_invisible(max(min(H.see_invisible, H.equipment_see_invis), vision[2]))

	if(H.equipment_tint_total >= TINT_BLIND)
		H.eye_blind = max(H.eye_blind, 1)

	if(!H.client)//no client, no screen to update
		return 1

	H.set_fullscreen(H.eye_blind && !H.equipment_prescription, "blind", /obj/screen/fullscreen/blind)
	H.set_fullscreen(H.stat == UNCONSCIOUS, "blackout", /obj/screen/fullscreen/blackout)

	if(config.welder_vision)
		H.set_fullscreen(H.equipment_tint_total, "welder", /obj/screen/fullscreen/impaired, H.equipment_tint_total)
	var/how_nearsighted = get_how_nearsighted(H)
	H.set_fullscreen(how_nearsighted, "nearsighted", /obj/screen/fullscreen/oxy, how_nearsighted)
	H.set_fullscreen(H.eye_blurry, "blurry", /obj/screen/fullscreen/blurry)
	H.set_fullscreen(H.drugged, "high", /obj/screen/fullscreen/high)
	if(H.drugged)
		H.add_client_color(/datum/client_color/oversaturated)
	else
		H.remove_client_color(/datum/client_color/oversaturated)

	for(var/overlay in H.equipment_overlays)
		H.client.screen |= overlay

	return 1

/decl/species/proc/get_how_nearsighted(var/mob/living/carbon/human/H)
	var/prescriptions = short_sighted
	if(H.disabilities & NEARSIGHTED)
		prescriptions += 7
	if(H.equipment_prescription)
		prescriptions -= H.equipment_prescription

	var/light = light_sensitive
	if(light)
		if(H.eyecheck() > FLASH_PROTECTION_NONE)
			light = 0
		else
			var/turf_brightness = 1
			var/turf/T = get_turf(H)
			if(T && T.lighting_overlay)
				turf_brightness = min(1, T.get_lumcount())
			if(turf_brightness < 0.33)
				light = 0
			else
				light = round(light * turf_brightness)
				if(H.equipment_light_protection)
					light -= H.equipment_light_protection
	return Clamp(max(prescriptions, light), 0, 7)

/decl/species/proc/set_default_hair(var/mob/living/carbon/human/H)
	if(H.h_style != H.species.default_h_style)
		H.h_style = H.species.default_h_style
		. = TRUE
	if(H.f_style != H.species.default_f_style)
		H.f_style = H.species.default_f_style
		. = TRUE
	if(.)
		H.update_hair()

/decl/species/proc/handle_additional_hair_loss(var/mob/living/carbon/human/H, var/defer_body_update = TRUE)
	return FALSE

/decl/species/proc/get_blood_name()
	return "blood"

/decl/species/proc/handle_death_check(var/mob/living/carbon/human/H)
	return FALSE

//Mostly for toasters
/decl/species/proc/handle_limbs_setup(var/mob/living/carbon/human/H)
	for(var/thing in H.organs)
		post_organ_rejuvenate(thing, H)

// Impliments different trails for species depending on if they're wearing shoes.
/decl/species/proc/get_move_trail(var/mob/living/carbon/human/H)
	if(H.lying)
		return /obj/effect/decal/cleanable/blood/tracks/body
	if(H.shoes || (H.wear_suit && (H.wear_suit.body_parts_covered & SLOT_FEET)))
		var/obj/item/clothing/shoes = (H.wear_suit && (H.wear_suit.body_parts_covered & SLOT_FEET)) ? H.wear_suit : H.shoes // suits take priority over shoes
		return shoes.move_trail
	else
		return move_trail

/decl/species/proc/update_skin(var/mob/living/carbon/human/H)
	return

/decl/species/proc/disarm_attackhand(var/mob/living/carbon/human/attacker, var/mob/living/carbon/human/target)
	attacker.do_attack_animation(target)

	if(target.w_uniform)
		target.w_uniform.add_fingerprint(attacker)
	var/obj/item/organ/external/affecting = target.get_organ(ran_zone(attacker.zone_sel.selecting, target = target))

	var/list/holding = list(target.get_active_hand() = 60)
	for(var/thing in target.get_inactive_held_items())
		holding[thing] = 30

	var/skill_mod = 10 * attacker.get_skill_difference(SKILL_COMBAT, target)
	var/state_mod = attacker.melee_accuracy_mods() - target.melee_accuracy_mods()
	var/push_mod = min(max(1 + attacker.get_skill_difference(SKILL_COMBAT, target), 1), 3)
	if(target.a_intent == I_HELP)
		state_mod -= 30
	//Handle unintended consequences
	for(var/obj/item/I in holding)
		var/hurt_prob = max(holding[I] - 2*skill_mod + state_mod, 0)
		if(prob(hurt_prob) && I.on_disarm_attempt(target, attacker))
			return

	var/randn = rand(1, 100) - skill_mod + state_mod
	if(!(check_no_slip(target)) && randn <= 25)
		var/armor_check = 100 * target.get_blocked_ratio(affecting, BRUTE, damage = 20)
		target.apply_effect(push_mod, WEAKEN, armor_check)
		playsound(target.loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
		if(armor_check < 100)
			target.visible_message("<span class='danger'>[attacker] has pushed [target]!</span>")
		else
			target.visible_message("<span class='warning'>[attacker] attempted to push [target]!</span>")
		return

	if(randn <= 60)
		//See about breaking grips or pulls
		if(target.break_all_grabs(attacker))
			playsound(target.loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
			return

		//Actually disarm them
		for(var/obj/item/I in holding)
			if(I && target.unEquip(I))
				target.visible_message("<span class='danger'>[attacker] has disarmed [target]!</span>")
				playsound(target.loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				return

	playsound(target.loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
	target.visible_message("<span class='danger'>[attacker] attempted to disarm \the [target]!</span>")

/decl/species/proc/disfigure_msg(var/mob/living/carbon/human/H) //Used for determining the message a disfigured face has on examine. To add a unique message, just add this onto a specific species and change the "return" message.
	var/datum/gender/T = gender_datums[H.get_gender()]
	return "<span class='danger'>[T.His] face is horribly mangled!</span>\n"

/decl/species/proc/max_skin_tone()
	if(appearance_flags & HAS_SKIN_TONE_GRAV)
		return 100
	if(appearance_flags & HAS_SKIN_TONE_SPCR)
		return 165
	if(appearance_flags & HAS_SKIN_TONE_TRITON)
		return 80
	return 220

/decl/species/proc/get_hair_styles()
	var/list/L = LAZYACCESS(hair_styles, type)
	if(!L)
		L = list()
		LAZYSET(hair_styles, type, L)
		for(var/hairstyle in GLOB.hair_styles_list)
			var/datum/sprite_accessory/S = GLOB.hair_styles_list[hairstyle]
			if(S.species_allowed && !(get_root_species_name() in S.species_allowed))
				continue
			if(S.subspecies_allowed && !(name in S.subspecies_allowed))
				continue
			ADD_SORTED(L, hairstyle, /proc/cmp_text_asc)
			L[hairstyle] = S
	return L

/decl/species/proc/get_facial_hair_styles(var/gender)
	var/list/facial_hair_styles_by_species = LAZYACCESS(facial_hair_styles, type)
	if(!facial_hair_styles_by_species)
		facial_hair_styles_by_species = list()
		LAZYSET(facial_hair_styles, type, facial_hair_styles_by_species)

	var/list/facial_hair_style_by_gender = facial_hair_styles_by_species[gender]
	if(!facial_hair_style_by_gender)
		facial_hair_style_by_gender = list()
		LAZYSET(facial_hair_styles_by_species, gender, facial_hair_style_by_gender)

		for(var/facialhairstyle in GLOB.facial_hair_styles_list)
			var/datum/sprite_accessory/S = GLOB.facial_hair_styles_list[facialhairstyle]
			if(gender == MALE && S.gender == FEMALE)
				continue
			if(gender == FEMALE && S.gender == MALE)
				continue
			if(S.species_allowed && !(get_root_species_name() in S.species_allowed))
				continue
			if(S.subspecies_allowed && !(name in S.subspecies_allowed))
				continue
			ADD_SORTED(facial_hair_style_by_gender, facialhairstyle, /proc/cmp_text_asc)
			facial_hair_style_by_gender[facialhairstyle] = S

	return facial_hair_style_by_gender

/decl/species/proc/get_description(var/header, var/append, var/verbose = TRUE, var/skip_detail, var/skip_photo)
	var/list/damage_types = list(
		"physical trauma" = brute_mod,
		"burns" = burn_mod,
		"lack of air" = oxy_mod,
		"poison" = toxins_mod
	)
	if(!header)
		header = "<center><h2>[name]</h2></center><hr/>"
	var/dat = list()
	dat += "[header]"
	dat += "<table padding='8px'>"
	dat += "<tr>"
	dat += "<td width = 400>"
	if(verbose || length(description) <= MAX_DESC_LEN)
		dat += "[description]"
	else
		dat += "[copytext(description, 1, MAX_DESC_LEN)] \[...\]"
	if(append)
		dat += "<br>[append]"
	dat += "</td>"
	if((!skip_photo && preview_icon) || !skip_detail)
		dat += "<td width = 200 align='center'>"
		if(!skip_photo && preview_icon)
			send_rsc(usr, icon(icon = preview_icon, icon_state = ""), "species_preview_[name].png")
			dat += "<img src='species_preview_[name].png' width='64px' height='64px'><br/><br/>"
		if(!skip_detail)
			dat += "<small>"
			if(spawn_flags & SPECIES_CAN_JOIN)
				dat += "</br><b>Often present among humans.</b>"
			if(spawn_flags & SPECIES_IS_WHITELISTED)
				dat += "</br><b>Whitelist restricted.</b>"
			if(!has_organ[BP_HEART])
				dat += "</br><b>Does not have blood.</b>"
			if(!has_organ[breathing_organ])
				dat += "</br><b>Does not breathe.</b>"
			if(species_flags & SPECIES_FLAG_NO_SCAN)
				dat += "</br><b>Does not have DNA.</b>"
			if(species_flags & SPECIES_FLAG_NO_PAIN)
				dat += "</br><b>Does not feel pain.</b>"
			if(species_flags & SPECIES_FLAG_NO_MINOR_CUT)
				dat += "</br><b>Has thick skin/scales.</b>"
			if(species_flags & SPECIES_FLAG_NO_SLIP)
				dat += "</br><b>Has excellent traction.</b>"
			if(species_flags & SPECIES_FLAG_NO_POISON)
				dat += "</br><b>Immune to most poisons.</b>"
			if(appearance_flags & HAS_A_SKIN_TONE)
				dat += "</br><b>Has a variety of skin tones.</b>"
			if(appearance_flags & HAS_SKIN_COLOR)
				dat += "</br><b>Has a variety of skin colours.</b>"
			if(appearance_flags & HAS_EYE_COLOR)
				dat += "</br><b>Has a variety of eye colours.</b>"
			if(species_flags & SPECIES_FLAG_IS_PLANT)
				dat += "</br><b>Has a plantlike physiology.</b>"
			if(slowdown)
				dat += "</br><b>Moves [slowdown > 0 ? "slower" : "faster"] than most.</b>"
			for(var/kind in damage_types)
				if(damage_types[kind] > 1)
					dat += "</br><b>Vulnerable to [kind].</b>"
				else if(damage_types[kind] < 1)
					dat += "</br><b>Resistant to [kind].</b>"
			if(breath_type)
				var/decl/material/mat = decls_repository.get_decl(breath_type)
				dat += "</br><b>They breathe [mat.gas_name].</b>"
			if(exhale_type)
				var/decl/material/mat = decls_repository.get_decl(exhale_type)
				dat += "</br><b>They exhale [mat.gas_name].</b>"
			if(LAZYLEN(poison_types))
				var/list/poison_names = list()
				for(var/g in poison_types)
					var/decl/material/mat = decls_repository.get_decl(exhale_type)
					poison_names |= mat.gas_name
				dat += "</br><b>[capitalize(english_list(poison_names))] [LAZYLEN(poison_names) == 1 ? "is" : "are"] poisonous to them.</b>"
			dat += "</small>"
		dat += "</td>"
	dat += "</tr>"
	dat += "</table><hr/>"
	return jointext(dat, null)

/mob/living/carbon/human/verb/check_species()
	set name = "Check Species Information"
	set category = "IC"
	set src = usr

	show_browser(src, species.get_description(), "window=species;size=700x400")

/decl/species/proc/skills_from_age(age)	//Converts an age into a skill point allocation modifier. Can be used to give skill point bonuses/penalities not depending on job.
	switch(age)
		if(0 to 22) 	. = -4
		if(23 to 30) 	. = 0
		if(31 to 45)	. = 4
		else			. = 8

/decl/species/proc/post_organ_rejuvenate(var/obj/item/organ/org, var/mob/living/carbon/human/H)
	if(org && (org.species ? org.species.is_crystalline : is_crystalline))
		org.status |= (ORGAN_BRITTLE|ORGAN_CRYSTAL)

/decl/species/proc/check_no_slip(var/mob/living/carbon/human/H)
	if(can_overcome_gravity(H))
		return TRUE
	return (species_flags & SPECIES_FLAG_NO_SLIP)

/decl/species/proc/get_pain_emote(var/mob/living/carbon/human/H, var/pain_power)
	if(!(species_flags & SPECIES_FLAG_NO_PAIN))
		return
	for(var/pain_emotes in pain_emotes_with_pain_level)
		var/pain_level = pain_emotes_with_pain_level[pain_emotes]
		if(pain_level >= pain_power)
			// This assumes that if a pain-level has been defined it also has a list of emotes to go with it
			var/decl/emote/E = decls_repository.get_decl(pick(pain_emotes))
			return E.key

/decl/species/proc/handle_exertion(mob/living/carbon/human/H)
	if (!exertion_effect_chance)
		return
	var/chance = exertion_effect_chance * H.encumbrance()
	if (chance && prob(H.skill_fail_chance(SKILL_HAULING, chance)))
		var/synthetic = H.isSynthetic()
		if (synthetic)
			if (exertion_charge_scale)
				var/obj/item/organ/internal/cell/cell = locate() in H.internal_organs
				if (cell)
					cell.use(cell.get_power_drain() * exertion_charge_scale)
		else
			if (exertion_hydration_scale)
				H.adjust_hydration(-DEFAULT_THIRST_FACTOR * exertion_hydration_scale)
			if (exertion_nutrition_scale)
				H.adjust_nutrition(-DEFAULT_HUNGER_FACTOR * exertion_nutrition_scale)
			if (exertion_reagent_scale && !isnull(exertion_reagent_path))
				H.make_reagent(REM * exertion_reagent_scale, exertion_reagent_path)
		if (prob(10))
			var/list/active_emotes = synthetic ? exertion_emotes_synthetic : exertion_emotes_biological
			if(length(active_emotes))
				var/decl/emote/exertion_emote = decls_repository.get_decl(pick(active_emotes))
				exertion_emote.do_emote(H)
