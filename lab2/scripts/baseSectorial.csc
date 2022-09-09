atget id id

set idBase -1
set numParq 0

atnd numTemp idsParq
vec cuposParq numTemp

for i 0 numTemp
	cprint i
	vset -1 cuposParq i
end

data mens "cupos" id
send mens

loop
wait 100
read resp
rdata resp tipo Pid valor

if(tipo=="basePrincipal")
	set idBase Pid
	set total 0
	for i 0 numTemp
		vget temp idsParq i
		if(temp!=-1)
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
		if(temp!=-1)
			plus total total temp
		end
	end
	data mens "cambioCupos" id total 
	send mens idBase
end