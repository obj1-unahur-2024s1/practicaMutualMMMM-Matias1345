class Actividad{	
	var property idioma = []
	
	method requiereEsfuerzo() 
	method sirveParaBroncearse()
	method diasDeActividad()
	method esInteresante() = idioma.size() > 1
	method esRecomendadaPara(unSocio)
}

class Viaje inherits Actividad{
	override method esRecomendadaPara(unSocio) = self.esInteresante() and unSocio.leAtrae(self) and 
	!(unSocio.actividadesRealizadas().contains(self))
}

class ViajePlaya inherits Viaje{
	var property largoDePlaya
	
	override method diasDeActividad() = largoDePlaya / 500
	override method requiereEsfuerzo() = largoDePlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcursionALaCiudad inherits Viaje{	
	var cantidadDeAtraccionesAVisitar
	
	override method diasDeActividad() = cantidadDeAtraccionesAVisitar/2
	override method requiereEsfuerzo() = cantidadDeAtraccionesAVisitar.between(5,8)
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or cantidadDeAtraccionesAVisitar == 5
}
		
class ExcursionCiudadTropical inherits ExcursionALaCiudad{
	override method diasDeActividad() = super() + 1
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje{	
	var kilometrosDeSenderoARecorrer
	var cantidadDeDiasDeSol
	
	override method diasDeActividad() = kilometrosDeSenderoARecorrer / 50
	override method requiereEsfuerzo() = kilometrosDeSenderoARecorrer > 80
	override method sirveParaBroncearse() = cantidadDeDiasDeSol > 200 or (cantidadDeDiasDeSol.between(100,200) and kilometrosDeSenderoARecorrer > 120)
	override method esInteresante() = super() and cantidadDeDiasDeSol > 140
}

class ClaseDeGimnasia inherits Actividad(idioma = ["Español"]){	
	override method diasDeActividad() = 1
	override method requiereEsfuerzo() = true
	override method sirveParaBroncearse() = false
	override method esRecomendadaPara(unSocio) = unSocio.edad().between(20,30)
}

class TallerLiterario inherits Actividad{
	const property librosTrabajados
	
	method idiomasUsados() = librosTrabajados.map({libro => libro.idioma()})
	override method diasDeActividad() = librosTrabajados.size() + 1
	override method requiereEsfuerzo() = librosTrabajados.any({libro => libro.cantidadPaginas() > 500}) or
		(librosTrabajados.map({libro => libro.autor()}).asSet().size() == 1 and //Son del mismo autor
		(librosTrabajados.size() > 1)) //Hay mas de 1 del mismo autor
	override method sirveParaBroncearse() = false
	override method esRecomendadaPara(unSocio) = unSocio.idiomasQueHabla().size() > 1
}

class Libro{
	const property idioma
	const property cantidadPaginas
	const property autor
}

