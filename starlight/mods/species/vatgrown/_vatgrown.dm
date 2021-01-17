#define SPECIES_VATGROWN "Vat-Grown Human"
#define CULTURE_HUMAN_VATGROWN "Nonborn"

/decl/modpack/vatgrown
	name = "Vat-Grown"

/mob/living/carbon/human/vatgrown/Initialize(mapload)
	..(mapload, SPECIES_VATGROWN)
