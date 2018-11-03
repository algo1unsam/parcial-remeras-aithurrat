import remeras.*

class Sucursal {

	var property pedidos = []
	var property cantDescuento = 10

	method descuento(cantidad) {
		return cantidad > cantDescuento
	}

	method totalFacturado() {
		return pedidos.sum{ pedido => pedido.precio() }
	}

	method pedidoMasCaro() {
		return pedidos.max{ pedido => pedido.precio() }
	}

	method agregarPedido(pedido){
		if(self.descuento(pedido.cantRemeras())){
			pedido.descuento(true)
		}else{
			pedidos.add(pedido)
		}
	}
}

class Pedido {

	var property tipoRemera = null
	var property cantRemeras = 0
	var property descuento = false

	method precioRemeras() {
		return (tipoRemera.costoRemera() * cantRemeras)
	}

	method descuento() {
		if (descuento) {
			return tipoRemera.descuento() * cantRemeras
		} else {
			return 0
		}
	}

	method precio() {
		return self.precioRemeras() - self.descuento()
	}

}

class Empresa {

	var property sucursales = []

	method agregarSucursal(sucursal) {
		sucursales.add(sucursal)
	}

	method totalFacturado() {
		return sucursales.sum{ sucursal => sucursal.totalFacturadoSucursal() }
	}

	method sucursalQueMasFacturo() {
		return sucursales.max{ sucursal => sucursal.totalFacturadoSucursal() }
	}

	method pedidoMasCaro() {
		var sucursalPedidoMasCaro = sucursales.max{ sucursal => sucursal.pedidoMasCaro().precio() }
		return sucursalPedidoMasCaro.max{ pedido => pedido.precio() }
	}

	method pedidosColorDado(color) {
		return sucursales.sum{ sucursal => sucursal.pedidos().filter{ pedido => pedido.tipoRemera().color() == color}.size() }
	}

}



