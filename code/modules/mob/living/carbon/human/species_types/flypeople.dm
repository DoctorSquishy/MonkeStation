/datum/species/fly
	name = "\improper Flyperson"
	id = SPECIES_FLY
	bodyflag = FLAG_FLY
	say_mod = "buzzes"
	species_traits = list(NOEYESPRITES, NO_UNDERWEAR, TRAIT_BEEFRIEND)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		)
	inherent_biotypes = list(MOB_ORGANIC,MOB_HUMANOID,MOB_BUG)

	meat = /obj/item/food/meat/slab/human/mutant/fly
	mutant_bodyparts = list("insect_type")
	default_features = list("insect_type" = "housefly", "body_size" = "Normal")
	burnmod = 1.4
	brutemod = 1.4
	speedmod = 0.7
	disliked_food = null
	liked_food = GROSS | MEAT | RAW | FRUIT
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/fly

	mutanttongue = /obj/item/organ/tongue/fly
	mutantliver = /obj/item/organ/liver/fly
	mutantstomach = /obj/item/organ/stomach/fly

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/fly,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/fly,
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm/fly,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm/fly,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/fly,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/fly,
	)

/datum/species/fly/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	if(chem.type == /datum/reagent/toxin/pestkiller)
		H.adjustToxLoss(3)
		H.reagents.remove_reagent(chem.type, chem.metabolization_rate)
		return TRUE
	if(istype(chem, /datum/reagent/consumable))
		var/datum/reagent/consumable/nutri_check = chem
		if(nutri_check.nutriment_factor > 0)
			var/turf/pos = get_turf(H)
			H.vomit(0, FALSE, FALSE, 2, TRUE)
			playsound(pos, 'sound/effects/splat.ogg', 50, 1)
			H.visible_message("<span class='danger'>[H] vomits on the floor!</span>", \
						"<span class='userdanger'>You throw up on the floor!</span>")
		return TRUE
	return ..()

/datum/species/fly/check_species_weakness(obj/item/weapon, mob/living/attacker)
	if(istype(weapon, /obj/item/melee/flyswatter))
		return 29 //Flyswatters deal 30x damage to flypeople.
	return 0
