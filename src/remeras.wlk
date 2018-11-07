class RemeraBasica{
	const property talle
	const property color
	const property colores=["blanco","negro","gris"]
	
	method esColorBasico(){
		return colores.contains(self.color()) 
	}
	
	method costo(){
		if( self.talle().between(32,40) and self.esColorBasico()){
			return 80
		}
		else if( self.talle().between(41,48) and self.esColorBasico() ){
			return 100
		}
		else if(self.talle().between(32,40)){
			return 80 + 80 * 0.10
		}
		else if( self.talle().between(41,48)){
			return 100+ 100 * 0.10
		}
	}
	
	method descuento()=10
}

class RemeraBordeada inherits RemeraBasica{
	var property cantidadDeColores//=numero
	
	override method costo(){
		if( cantidadDeColores <= 2 ){
			return super() + 20
		}
		else{
			return super() + cantidadDeColores * 10
		}
	}
	
	
}

class RemeraSubliminada inherits RemeraBasica{
	var anchoDelDibujo
	var largoDelDibujo 
	const empresaDelDibujo
	
	method costoDeDerechos(){
		return empresaDelDibujo.derechosDeAutor()
	}
	method costoDelDibujo(){
		return anchoDelDibujo*largoDelDibujo* 0.5 + empresaDelDibujo.derechosDeAutor()
	}
	
	override method costo(){
			return super() + self.costoDelDibujo() 
	}
	
	override method descuento(){
		if( empresaDelDibujo.tieneConvenio() ){
			return 20
		}
		else{
			return 0
		}
	}
}

class Empresa{
	var property derechosDeAutor//numero
	var property tieneConvenio//boleano
}

