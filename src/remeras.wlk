class Remera {

	var talle = 0
	var property color = null

	method precioTalle() {
		if (talle > 40 && talle < 49) {
			return 100
		} else if (talle > 31 && talle < 41) {
			return 80
		} else {
			throw ("talle incorrecto")
		}
	}

	method precioColores() {
		return color.precio(self.precioTalle())
	}

	method costoRemera() {
		return self.precioTalle() + self.precioColores()
	}

	method descuento() {
		return 0.1 * self.costoRemera()
	}

}

class ColorBase {

	method precio(costo) {
		return 0
	}

}

class ColorEspecial inherits ColorBase {

	override method precio(costo) {
		return costo * 0.1
	}

}

class Bordada inherits Remera {

	var property cantColores = 0

	method precioBordado() {
		if (cantColores < 2) {
			return 20
		} else {
			return cantColores * 10
		}
	}

	override method costoRemera() {
		return super() + self.precioBordado()
	}

	override method descuento() {
		return 0
	}

}

class Sublimada inherits Remera {

	var property altura = 0
	var property ancho = 0
	var property derechos = 0
	var property marca = null

	method precioSublimado() {
		return (ancho * altura * 0.5) + marca.derechos()
	}

	override method costoRemera() {
		return super() + self.precioSublimado()
	}

	override method descuento() {
		if (marca.convenio()) {
			return 0.2 * self.costoRemera()
		} else {
			return super()
		}
	}

}

class Marca {

	var property derechos = 0
	var property convenio = false

}

