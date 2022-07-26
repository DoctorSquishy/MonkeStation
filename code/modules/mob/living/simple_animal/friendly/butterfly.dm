/mob/living/simple_animal/butterfly
	name = "butterfly"
	desc = "A colorful butterfly, how'd it get up here?"
	icon_state = "butterfly"
	icon_living = "butterfly"
	icon_dead = "butterfly_dead"
	turns_per_move = 1
	response_help = "shoos"
	response_disarm = "brushes aside"
	response_harm = "squashes"
	speak_emote = list("flutters")
	maxHealth = 2
	health = 2
	friendly = "nudges"
	density = FALSE
	movement_type = FLYING
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_TINY
	mob_biotypes = list(MOB_ORGANIC, MOB_BUG)
	gold_core_spawnable = FRIENDLY_SPAWN
	verb_say = "flutters"
	verb_ask = "flutters inquisitively"
	verb_exclaim = "flutters intensely"
	verb_yell = "flutters intensely"

/mob/living/simple_animal/butterfly/Initialize(mapload)
	. = ..()
	var/newcolor = rgb(rand(0, 255), rand(0, 255), rand(0, 255))
	chat_color = newcolor
	add_atom_colour(newcolor, FIXED_COLOUR_PRIORITY)
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/simple_animal/butterfly/bee_friendly()
	return TRUE //treaty signed at the Beeneeva convention
