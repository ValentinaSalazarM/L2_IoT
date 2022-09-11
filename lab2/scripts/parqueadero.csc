atget id id
set cupos 1
set first 0
set baseSect -1
loop
dreadsensor actividad
atnd nuevos

wait 1000
read mens
rdata mens tipo Bid 

if (baseSect==-1)
	if(tipo=="cupos")
		set baseSect Bid
		data mens "cupos" id cupos
		send mens baseSect
	end
end
if (baseSect!=-1)
	if actividad == 1
		if first == 0
			set cupos cupos-1
			set first 1
			data mens "cambioParqueadero" id cupos
			send mens baseSect
		end
		print "Ocupado"
	else
		if first != 0
			set cupos cupos+1
			set first 0
			data mens "cambioParqueadero" id cupos
			send mens baseSect
		end
		print "Libre"
	end
end

