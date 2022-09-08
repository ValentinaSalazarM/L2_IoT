vec basesSectoriales 5
atget id id

wait 3000
data mens "basePrincipal" id
send mens

loop

read resp
rdata resp tipo Bid total
dec Bid

if(tipo=="numParqueaderos")
	vset total basesSectoriales Bid
end	

if(tipo=="cambioCupos")
	vset valor basesSectoriales Pid 
	conc strTemp "Cupos de base sectorial " Pid
	conc strTemp strTemp ": "
	conc strTemp strTemp total
end