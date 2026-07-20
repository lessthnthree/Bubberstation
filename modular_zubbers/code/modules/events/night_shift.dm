/datum/controller/subsystem/events
	// last time we ran night shift
	var/previous_night_shift

// because we can run night shift multiple times over 3+ hour rounds, we enforce a minimum time between night shift triggers
/datum/round_event_control/nightshift/can_spawn_event(players_amt, allow_magic = FALSE)
	. = ..()
	if(!.)
		return

	if(!SSevents.previous_night_shift)
		return TRUE

	if(world.time <= SSevents.previous_night_shift + 45 MINUTES)
		return FALSE

	return TRUE

/datum/round_event/nightshift/setup()
	SSevents.previous_night_shift = world.time
