/datum/gear/resomi
	sort_category = "Xenowear"
	whitelisted   = list(SPECIES_RESOMI)
	category      = /datum/gear/resomi
	slot = slot_w_uniform_str

//Uniforms

/datum/gear/resomi/uniform_selection
	display_name = "resomi uniform selection"
	path         = /obj/item/clothing/under/resomi

/datum/gear/resomi/uniform_selection/New()
	..()
	var/list/uniforms = list()
	uniforms["grey smock"]        = /obj/item/clothing/under/resomi/simple
	uniforms["rainbow smock"]     = /obj/item/clothing/under/resomi/rainbow
	uniforms["engineering smock"] = /obj/item/clothing/under/resomi/engine
	uniforms["medical smock"]     = /obj/item/clothing/under/resomi/medical
	uniforms["security smock"]    = /obj/item/clothing/under/resomi/security
	uniforms["science smock"]     = /obj/item/clothing/under/resomi/science
	uniforms["command uniform"]   = /obj/item/clothing/under/resomi/command
	uniforms["work uniform"]      = /obj/item/clothing/under/resomi/work
	gear_tweaks += new/datum/gear_tweak/path(uniforms)

/datum/gear/resomi/uniform_color
	display_name = "colorable resomi jumpsuit"
	path         = /obj/item/clothing/under/resomi
	flags        = GEAR_HAS_COLOR_SELECTION

/datum/gear/resomi/space
	display_name = "resomi pressure suit"
	path         = /obj/item/clothing/under/resomi/space

/datum/gear/resomi/polychromic_cloak
	display_name = "resomi polychromic cloak"
	path         = /obj/item/clothing/suit/storage/hooded/polychromic
	flags        = GEAR_HAS_COLOR_SELECTION
	slot         = slot_wear_suit_str

/datum/gear/resomi/shoes
	display_name = "resomi footwear selection"
	path         = /obj/item/clothing/shoes/resomi
	flags        = GEAR_HAS_COLOR_SELECTION
	slot         = slot_shoes_str

/datum/gear/resomi/shoes/New()
	..()
	var/list/footwear = list()
	footwear["koishi"]      = /obj/item/clothing/shoes/resomi/footwraps/socks_resomi
	footwear["footwraps"]    = /obj/item/clothing/shoes/resomi/footwraps
	footwear["small shoes"] = /obj/item/clothing/shoes/resomi
	gear_tweaks += new/datum/gear_tweak/path(footwear)