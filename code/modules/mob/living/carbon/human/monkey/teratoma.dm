/mob/living/carbon/human/species/monkey/tumor
	name = "living teratoma"
	verb_say = "blabbers"
	initial_language_holder = /datum/language_holder/monkey
	icon = 'icons/mob/monkey.dmi'
	icon_state = null
	butcher_results = list(/obj/effect/spawner/lootdrop/teratoma/minor = 5, /obj/effect/spawner/lootdrop/teratoma/major = 1)
	type_of_meat = /obj/effect/spawner/lootdrop/teratoma/minor
	bodyparts = list(/obj/item/bodypart/chest/monkey/teratoma, /obj/item/bodypart/head/monkey/teratoma, /obj/item/bodypart/l_arm/monkey/teratoma,
						/obj/item/bodypart/r_arm/monkey/teratoma, /obj/item/bodypart/r_leg/monkey/teratoma, /obj/item/bodypart/l_leg/monkey/teratoma)
	ai_controller = null

/datum/dna/tumor
	species = new /datum/species/teratoma

/datum/species/teratoma
	name = "Teratoma"
	id = "teratoma"
	say_mod = "mumbles"
	species_traits = list(NOTRANSSTING, NO_DNA_COPY, EYECOLOR, HAIR, FACEHAIR, LIPS)
	inherent_traits = list(
		TRAIT_NOHUNGER,
		TRAIT_RADIMMUNE,
		TRAIT_BADDNA,
		TRAIT_NOGUNS,
		TRAIT_NONECRODISEASE,
		TRAIT_DISCOORDINATED_TOOL_USER) //Made of mutated cells
	default_features = list("mcolor" = "FFF", "wings" = "None")
	skinned_type = /obj/item/stack/sheet/animalhide/monkey
	liked_food = JUNKFOOD | FRIED | GROSS | RAW
	changesource_flags = MIRROR_BADMIN

	// Internal Organs
	mutant_brain = /obj/item/organ/brain/tumor

	// Bodyparts
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/monkey/teratoma,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/monkey/teratoma,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/monkey/teratoma,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/monkey/teratoma,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/monkey/teratoma,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/monkey/teratoma,
		)

/obj/item/organ/brain/tumor
	name = "teratoma brain"

/obj/item/organ/brain/tumor/Remove(mob/living/carbon/C, special, no_id_transfer)
	. = ..()
	//Removing it deletes it
	if(!QDELETED(src))
		qdel(src)

/mob/living/carbon/human/species/monkey/tumor/handle_mutations_and_radiation()
	return

/mob/living/carbon/human/species/monkey/tumor/can_use_guns(obj/item/G)
	return FALSE


/mob/living/carbon/human/species/monkey/tumor/has_dna()
	return FALSE

/mob/living/carbon/human/species/monkey/tumor/create_dna()
	dna = new /datum/dna/tumor(src)
	//Give us the juicy mutant organs
	dna.species.on_species_gain(src, null, FALSE)
	dna.species.regenerate_organs(src, replace_current = TRUE)
