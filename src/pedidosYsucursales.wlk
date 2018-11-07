import remeras.*



class Pedido{
	var property modeloDeRemera
	var property cantidadDeRemera
	var property sucursal
	
	method costoBase(){
		return self.modeloDeRemera().costo() * cantidadDeRemera
	}
	
	method hayDescuento(){
		return cantidadDeRemera > sucursal.cantidadMinima() 
	}
	
	method descuento(){
		return self.costoBase() * modeloDeRemera.descuento() / 100
	}
	
	method precioDelPedido(){
		if( self.hayDescuento()){
			return self.costoBase() - self.descuento()
		}
		else{
			return self.costoBase()
		}
	}
	
}


class Sucursal{
	const property cantidadMinima
	
}	


