#define RESOMI_SPRITESHEETS(A, B) if(!A) {A = B}

/obj/item/clothing/glasses/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/glasses_prescription.dmi')
	. = ..()

/obj/item/clothing/glasses/blindfold/tape/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/blindfold_tape.dmi')
	. = ..()

/obj/item/clothing/glasses/blindfold/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/blindfold.dmi')
	. = ..()

/obj/item/clothing/glasses/eyepatch/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/eyepatch.dmi')
	. = ..()

/obj/item/clothing/glasses/eyepatch/hud/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hudpatch.dmi')
	. = ..()

/obj/item/clothing/glasses/meson/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/scanner_meson.dmi')
	. = ..()

/obj/item/clothing/glasses/science/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/goggles_science.dmi')
	. = ..()

/obj/item/clothing/glasses/night/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/night_vision.dmi')
	. = ..()

/obj/item/clothing/glasses/tacgoggles/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/tactical.dmi')
	. = ..()

/obj/item/clothing/glasses/material/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/scanner_material.dmi')
	. = ..()

/obj/item/clothing/glasses/threedglasses/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/glasses_3d.dmi')
	. = ..()

/obj/item/clothing/glasses/welding/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/goggles_welding.dmi')
	. = ..()

/obj/item/clothing/glasses/welding/superior/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/goggles_welding_superior.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/health/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_medical.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/health/prescription/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_medical_prescription.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/health/visor/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_medical_visor.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/security/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_security.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/security/prescription/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_security_prescription.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/security/jensenshades/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_security_shades.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/janitor/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_janitor.dmi')
	. = ..()

/obj/item/clothing/glasses/hud/janitor/prescription/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_janitor_prescription.dmi')
	. = ..()

/obj/item/clothing/glasses/prescription/scanners/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/goggles_scanning.dmi')
	. = ..()

/obj/item/clothing/glasses/prescription/hipster/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/glasses_hipster.dmi')
	. = ..()

/obj/item/clothing/glasses/prescription/gglasses/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/glasses_green.dmi')
	. = ..()

/obj/item/clothing/glasses/sunglasses/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/sunglasses.dmi')
	. = ..()

/obj/item/clothing/glasses/sunglasses/big/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/sunglasses_big.dmi')
	. = ..()

/obj/item/clothing/glasses/sunglasses/sechud/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/sunglasses_hud.dmi')
	. = ..()

/obj/item/clothing/glasses/sunglasses/sechud/goggles/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/goggles_hud.dmi')
	. = ..()

/obj/item/clothing/glasses/sunglasses/sechud/toggle/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/hud_sec_aviators.dmi')
	. = ..()

/obj/item/clothing/glasses/thermal/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/scanner_thermal.dmi')
	. = ..()

/obj/item/clothing/glasses/thermal/syndi/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/scanner_meson.dmi')
	. = ..()

/obj/item/clothing/glasses/thermal/plain/monocle/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/thermoncle.dmi')
	. = ..()

/obj/item/clothing/glasses/thermal/plain/eyepatch/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/eyepatch.dmi')
	. = ..()

/obj/item/clothing/glasses/thermal/plain/jensen/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/thermal_implants.dmi')
	. = ..()

/obj/item/clothing/glasses/eyepatch/monocle/Initialize()
	LAZYINITLIST(sprite_sheets)
	RESOMI_SPRITESHEETS(sprite_sheets[BODYTYPE_RESOMI] , 'starlight/mods/species/resomi/icons/clothing/exp/eyes/monocle.dmi')
	. = ..()
#undef RESOMI_SPRITESHEETS