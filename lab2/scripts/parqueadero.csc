atget id id
set cupos 1
set actuales 1
set baseSect -1

loop
wait 1000
atnd nuevos
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
	if nuevos != 1
		cprint "Nuevos " nuevos 
		cprint "Actuales " actuales
		if nuevos > actuales
			set diff nuevos-actuales
			set cupos cupos-diff
			data mens "entradaParqueadero" id cupos
			send mens baseSect
		end
		if nuevos < actuales
			set diff actuales-nuevos
			set cupos cupos-diff
			data mens "salidaParqueadero" id cupos
			send mens baseSect
		end
		set actuales nuevos
	end
end

