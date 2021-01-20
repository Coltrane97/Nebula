#define SPECIES_RESOMI "Resomi"
#define CULTURE_RESOMI SPECIES_RESOMI
#define LANGUAGE_RESOMI "Schechi"
#define BODYTYPE_RESOMI "resomi body"

/decl/modpack/resomi
	name = "Resomi"

/mob/living/carbon/human/resomi/Initialize(mapload)
	..(mapload, SPECIES_RESOMI)
