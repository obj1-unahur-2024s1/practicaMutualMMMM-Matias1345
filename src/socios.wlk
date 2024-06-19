import actividades.*

class Socio{
	const actividadesRealizadas = []
	var maximoDeActs
	var property edad
	var property idiomasQueHabla

	method adoradorDelSol() = actividadesRealizadas.all({actividad => actividad.sirveParaBroncearse()})
	
	method actividadesEsforzadas() =  actividadesRealizadas.filter({actividad => actividad.requiereEsfuerzo()})
	
	method realizarActividad(unaActividad){
		if(actividadesRealizadas.size() >= maximoDeActs){	
		 		throw new Exception (message = "Maximo de actividades alcanzado")
		 }
		actividadesRealizadas.add(unaActividad)	
	}
	
	method leAtrae(unaActividad)	
}

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActividad) = unaActividad.diasDeActividad() >= 4
}

class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad) = (self.adoradorDelSol() and unaActividad.sirveParaBroncearse())
	or unaActividad.requiereEsfuerzo()
}

class SocioRelajado inherits Socio{
	override method leAtrae(unaActividad) = self.idiomasQueHabla().any({i => 
		unaActividad.idioma().contains(i)})
}