set idBase -1
vec cupos 3
atget id id

data mens "cupos" id
send mens

loop
read resp
rdata resp tipo Pid valor

if(tipo=="basePrincipal")
	set idBase Pid
	//Calcular total sumando lo que está en el vector
	data mens "numParqueaderos" id total
	send mens idBase
end	

if(tipo=="cupos")
	dec Pid
	vset valor cupos Pid 
end
if((tipo=="entradaParqueadero") || (tipo=="salidaParqueadero"))
	dec Pid
	vset valor cupos Pid 
	data mens "cambioCupos" Pid valor
	send mens idBase
end