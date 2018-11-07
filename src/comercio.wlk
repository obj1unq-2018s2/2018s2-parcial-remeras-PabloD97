import remeras.*
import pedidosYsucursales.*

class Comercio{
	var property pedidos=[]
	
	//1
	method registrarPedido(pedido){
		pedidos.add(pedido)
	}
	//2
	method totalFacturado(){
		return pedidos.sum({ pedido=> pedido.precioDelPedido()})
	}
	//3
	method tatalFacturadoDeSucursal(sucursal){
		return pedidos.filter({
			pedido=> pedido.sucursal() == sucursal
		}).sum({ pedido=> pedido.precioDelPedido()})
	}
	//4
	method pedidosDeRemerasDe(color){
		return pedidos.filter({ 
			pedido=>pedido.modeloDeRemera().color() == color
		}).size()
	}
	//5
	method pedidoMasCaro(){
		return pedidos.max({ 
			pedido=>pedido.precioDelPedido()
		})
	}
	//6
	
	method noHuboPedidosDeTalle(){
		
		return pedidos.map({ pedido=>pedido.modeloDeRemera().talle() })
	}
	
	//7
	method sucursalQueMasFacturo(){
		return pedidos.max({
			pedido=> self.tatalFacturadoDeSucursal(pedido.sucursal())
		}).sucursal()
	}
	
	//8
	
	
}


