vec basesSectoriales 5
atget id id

data mens "basePrincipal" id
send mens

loop

read resp
rdata resp tipo Bid valor
dec Bid

if(tipo=="numParqueaderos")
	vset valor basesSectoriales Bid
end	

if(tipo=="cambioCupos")
	vset valor basesSectoriales Pid 
	cprint "Cupos Base Sectorial " + Pid ": " valor
end

if((tipo=="entradaParqueadero") || (tipo=="salidaParqueadero"))
	dec Pid
	vset valor cupos Pid 
	data mens "cambioCupos" Pid valor
	send mens idBase
end