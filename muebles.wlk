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

    method utilidad() {
        return self.sumaUtilidadCosasGuardadas() / self.precio()
    }

    method sumaUtilidadCosasGuardadas() {
        return cosasGuardadas.sum({cosa => cosa.utilidad()})
    }

    method precio()

    method cosaMenosUtil() {
        return cosasGuardadas.min({cosa => cosa.utilidad()})
    }

    method remover(cosa) {
        cosasGuardadas.remove(cosa)
    }
}

class Baul inherits Mueble {
    const property volumenMax

    override method condicionParaGuardar(cosa) {
        return self.volumenTotal() + cosa.volumen() <= volumenMax
    }

    method volumenTotal() {
        return cosasGuardadas.sum({cosa => cosa.volumen()})
    }

    override method precio() {
        return volumenMax + 2
    }

    override method utilidad() {
        return super() + self.extra()
    }

    method extra() {
        return if (self.todasLasCosasSonReliquias()) 2 else 0
    }

    method todasLasCosasSonReliquias() {
        return cosasGuardadas.all({cosa => cosa.esReliquia()})
    }
}

class BaulMagico inherits Baul {

    override method precio() {
        return super() * 2
    }

    override method utilidad() {
        return super() + self.cantidadElementosMagicos()
    } 

    method cantidadElementosMagicos() {
        return self.elementosMagicosGuardados().size()
    }

    method elementosMagicosGuardados() {
        return cosasGuardadas.filter({cosa => cosa.esMagico()})
    }
}

class GabineteMagico inherits Mueble {
    const property precio

    override method condicionParaGuardar(cosa) {
        return cosa.esMagico()
    }

    override method precio() {
        return precio
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

    override method precio() {
        return 5 * capacidadMax
    }
}

