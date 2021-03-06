mob/var/delay=10
mob/var/tmp/move=1

var/time_scale = 1

mob/var/run = 0
mob/var/stamina
mob/var/stamina_max = 100

mob/New()
	..()
	stamina = stamina_max

mob
	Stat()
		..()
		stat("Stamina:",stamina)
		stat("Hitpoints:",hp)

mob/verb/run_or_move()
	if(run == 0)
		run = 1
	else
		run = 0

mob/var/allow_move = 1

mob/Move()
	if(allow_move == 0 || stamina <= 1)
		run = 0
		return
	if(src.move)
		src.move=0
		..()
		if(run == 0)
			sleep(calcutale_step())
		else
			sleep(calcutale_step())
			stamina -= 1
		src.move=1


mob/proc/calcutale_step()
	var/step_time
	var/movement_mod = 4
	for(var/obj/bodypart/human/right_leg/h in bodyparts)
		if(h.fracture) break
		movement_mod /= 2
	for(var/obj/bodypart/human/left_leg/h in bodyparts)
		if(h.fracture) break
		movement_mod /= 2
	if(run == 0)
		step_time = delay*time_scale*movement_mod
	else
		step_time = delay/10*time_scale*movement_mod
	return step_time
