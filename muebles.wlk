import cosas.*
import academia.*

class Mueble {
    var property cosasGuardadas

    method guardar(cosa) {
        if (self.puedeGuardar(cosa)) {
            cosasGuardadas.add(cosa)
        }
    }

    method puedeGuardar(cosa) {
        return (not self.verSiEstaGuardado(cosa)) and self.condicionParaGuardar(cosa)
    }

    method validarSiEstaGuardado(cosa) {
        return if (self.verSiEstaGuardado(cosa)) {
            self.error ("Ya esta guardada esta cosa en el Mueble")
        }
    }

    method verSiEstaGuardado(cosa) {
        return cosasGuardadas.contains(cosa)
    }

    method condicionParaGuardar(cosa)
}

class Baul inherits Mueble {
    const property volumenMax

    override method condicionParaGuardar(cosa) {
        return self.volumenTotal() + cosa.volumen() <= volumenMax
    }

    method volumenTotal() {
        return cosasGuardadas.sum({cosa => cosa.volumen()})
    }
}

class GabineteMagico inherits Mueble {
    
    override method condicionParaGuardar(cosa) {
        return cosa.esMagico()
    }
}

class Armario inherits Mueble {
    var property capacidadMax

    override method condicionParaGuardar(cosa) {
        return self.cantidadCosasGuardadas() + 1 <= capacidadMax
    }

    method cantidadCosasGuardadas() {
        return cosasGuardadas.size()
    }
}

