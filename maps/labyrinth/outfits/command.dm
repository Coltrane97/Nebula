/decl/hierarchy/outfit/job/labyrinth/basic/director
	name = "Facility Director Outfit"
	uniform = /obj/item/clothing/pants/baggy/casual/classicjeans
	shoes = /obj/item/clothing/shoes/color/black
	pda_type = /obj/item/modular_computer/pda/heads/captain
	r_pocket = /obj/item/radio
	id_type = /obj/item/card/id/gold/director

/decl/hierarchy/outfit/job/labyrinth/basic/director/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)

/decl/hierarchy/outfit/job/labyrinth/basic/manager
	name = "Facility Manager Outfit"
	uniform = /obj/item/clothing/under/suit_jacket/checkered
	shoes = /obj/item/clothing/shoes/dress
	glasses = /obj/item/clothing/glasses/sunglasses/big
	hands = list(/obj/item/clipboard)
	id_type = /obj/item/card/id/silver/manager
	pda_type = /obj/item/modular_computer/pda/heads/hop

//id cards
/obj/item/card/id/gold/director
	job_access_type = /datum/job/director

/obj/item/card/id/silver/manager
	job_access_type = /datum/job/manager
