atnd numBases basesSectoriales
atget id id

wait 3000
data mens "basePrincipal" id
send mens

vec cuposBase numBases

for i 0 numBases
	vset -1 cuposBase i
end

loop

read resp
rdata resp tipo Bid total
dec Bid

if(tipo=="numParqueaderos")
	for i 0 numBases
		vget tempId basesSectoriales i
		if(tempId==Bid)
			vset total cuposBase i
		end 		
	end
end	

if(tipo=="cambioCupos")
	for i 0 numBases
		vget tempId basesSectoriales i
		if(tempId==Bid)
			vset total cuposBase i
		end 		
	end
	conc strTemp "Cupos de base sectorial " Bid
	conc strTemp strTemp ": "
	conc strTemp strTemp total
end