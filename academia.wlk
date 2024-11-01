import muebles.*
import cosas.*

class Academia {
	var property muebles = #{}

	method estaGuardada(cosa) { //1
		return muebles.any({mueble => mueble.verSiEstaGuardado(cosa)})
	}

	method muebleEnQueEstaGuardado(cosa) { //2
		return muebles.find({mueble => mueble.verSiEstaGuardado(cosa)})
	}

	method puedeGuardarEnAlgunMueble(cosa) {//3
		return muebles.any({mueble => mueble.puedeGuardar(cosa)})
	}

	method puedeGuardar(cosa) {
		return (not self.estaGuardada(cosa)) and self.puedeGuardarEnAlgunMueble(cosa)
	}

	method mueblesEnLosQuePuedeGuardar(cosa) { //4
		return muebles.filter({mueble => mueble.puedeGuardar(cosa)})
	}

	method validarSiPuedeGuardar(cosa) {
		return if (not self.puedeGuardar(cosa)) {
			self.error("No puedo guardar esta cosa")
		}
	}

	method guardar(cosa) {
	self.validarSiPuedeGuardar(cosa)
	self.algunMuebleDondePuedeGuardar(cosa).guardar(cosa)
	}

	method algunMuebleDondePuedeGuardar(cosa) {
		return self.mueblesEnLosQuePuedeGuardar(cosa).anyOne()
	}

	method cosasMenosUtiles() {
		return muebles.map({mueble => mueble.cosaMenosUtil()}).asSet()
	}

	method marcaMenosUtil() {
		return self.cosasMenosUtiles().min({c => c.utilidad()}).marca()
	}

	method cantidadDeMuebles() {
		return muebles.size()
	}

	method cosasMenosUtilesYNoMagicas() {
		return self.cosasMenosUtiles().filter({cosa => not cosa.esMagico()})
	}

	method removercosasMenosUtilesYNoMagicas() {
		return self.cosasMenosUtilesYNoMagicas().forEach({cosa => self.remover(cosa)})
	}

	method remover(cosa) {
		if (self.cantidadDeMuebles() >= 3) {
			self.muebleEnQueEstaGuardado(cosa).remover(cosa)
		}
	}
}
