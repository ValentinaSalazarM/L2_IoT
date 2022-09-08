atget id id

set idBase -1
set numParq

atnd numTemp

vec idsParq numTemp
vec cuposParq numTemp

data mens "cupos" id
send mens

loop
read resp
rdata resp tipo Pid valor

if(tipo=="basePrincipal")
	set idBase Pid
	set total 0
	for i 0 numTemp
		vget temp idsParq i
		if(temp>=1)
			plus total total temp
		end
	end
	data mens "numParqueaderos" id total
	send mens idBase
end	

if(tipo=="cupos")
	for i 0 numTemp
		vget tempId idsParq i
		if(tempId==Pid)
			vset valor cuposParq i
		end 		
	end

	vset valor cupos Pid 
end
if((tipo=="entradaParqueadero") || (tipo=="salidaParqueadero"))
	for i 0 numTemp
		vget tempId idsParq i
		if(tempId==Pid)
			vset valor cuposParq i
		end 		
	end
	set total 0
	for i 0 numTemp
		vget temp idsParq i
		if(temp>=1)
			plus total total temp
		end
	end
	data mens "cambioCupos" id total 
	send mens idBase
end