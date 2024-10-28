import muebles.*
import cosas.*

object academia {
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

	method muebleQuePuedeGuardar(cosa) { //4
		return muebles.find({mueble => mueble.puedeGuardar(cosa)})
	}

	method guardar(cosa) {
		if (self.puedeGuardarEnAlgunMueble(cosa)) {
			self.muebleQuePuedeGuardar(cosa).guardar(cosa)
		}
	}
}
