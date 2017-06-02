mob/verb/respawn()
	if(alive != 0)
		usr<< "������� ����� �������"
		return
	x = 1
	y = 1
	z = 1
	icon_state = "body_m_s"
	allow_move = 1
	density = 1
	alive = 1
	stamina = stamina_max
	hp = 35

mob/verb/chage_atributes()
	var/inst = input("st") as num
	st = inst
	var/indx = input("dx") as num
	dx = indx
	var/inht = input("ht") as num
	ht = inht
	recalculate(1)

mob/verb/rotate_test()
	var/icon/i = new(src.icon,src.icon_state)
	i.Turn(90)
	src.icon = i

mob/verb/off_ai()
	for(var/mob/M in world)
		M.ai = 0

mob/verb/change_time_scale()
	//set hidden = 1
	var/input = input("1 - normal speed") as num
	time_scale = input

mob/verb/say(message as text)
	var/index = findtext(message, "�")
	while(index)
		message = copytext(message, 1, index) + "&#255;" + copytext(message, index+1)
		index = findtext(message, "�")
	world<< "[name] says, [message]"

mob/verb/spawn_ai_human()
	var/mob/M = new
	M.x = 1
	M.y = 1
	M.z = 1
	M.icon_state = "team1"

mob/verb/spawn_ai_human_another_team()
	var/mob/M = new
	M.x = 14
	M.y = 14
	M.z = 1
	M.team = "2"
	M.icon_state = "team2"

mob/var/ai_coolness = "dawn"

mob/verb/spawn_special_ai()
	var/mob/M = new
	M.x = 1
	M.y = 1
	M.z = 1
	M.team = "3"
	switch(input("������� ����� ��� ����������?") in list("����","���������","�����","����� �������","���������","������������","�����"))
		if("����")
			usr<< "��� ���������. � �����."
			ai_coolness = "dawn"
		if("���������")
			usr<< "�� ����� ����� ���� ������ ��� �� �����"
			ai_coolness = "oligofren"
		if("�����")
			usr<< "�� ����� ����� ���� ������ ��� �� �����"
			ai_coolness = "dawn"
		if("����� �������")
			usr<< "�� ����� ����� ���� ������ ��� �� �����"
			ai_coolness = "dawn"
		if("���������")
			usr<< "�� ����� ����� ���� ������ ��� �� �����"
			ai_coolness = "dawn"
		if("������������")
			usr<< "�� ����� ����� ���� ������ ��� �� �����"
			ai_coolness = "dawn"
		if("�����")
			usr<< "�� ����� ����� ���� ������ ��� �� �����"
			ai_coolness = "dawn"

mob/verb/puk()
	alpha = 100