atget id id
set cupos id
set actuales 0
set baseSect -1

loop
wait 100
atnd nuevos
read mens
rdata mens tipo Bid 

if(tipo=="cupos")
	set baseSect Bid
	data mens "cupos" id cupos
	send mens baseSect
end

if nuevos > 0
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
end

