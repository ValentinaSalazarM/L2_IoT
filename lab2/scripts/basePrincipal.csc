atnd numBases basesSectoriales
atget id id

delay 5000
data mens "basePrincipal" id
send mens

vec cuposBase numBases

for i 0 numBases
	vset -1 cuposBase i
end

loop
wait 1000
read resp
rdata resp tipo Bid total

if(tipo=="numParqueaderos")
	set valor 0
	for i 0 numBases
		vget tempId basesSectoriales i
		if(tempId==Bid)
			vset total cuposBase i
		end
		vget temp cuposBase i
		plus valor valor temp
	end
	print "Numero de parqueaderos disponibles " valor
end	

if(tipo=="cambioCupos")
	set valor 0
	for i 0 numBases
		vget tempId basesSectoriales i
		if(tempId==Bid)
			vset total cuposBase i
		end 
		vget temp cuposBase i
		plus valor valor temp		
	end
	print "Número de parqueaderos disponibles " valor
end
