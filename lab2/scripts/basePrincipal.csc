atnd numBases basesSectoriales
atget id id

delay 5000
data mens "basePrincipal" id
send mens

vec cuposBase numBases

for i 0 numBases
	cprint i
	vset -1 cuposBase i
end

loop
wait 1000
read resp
rdata resp tipo Bid total

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
	cprint "Cupos de base sectorial " total
end
