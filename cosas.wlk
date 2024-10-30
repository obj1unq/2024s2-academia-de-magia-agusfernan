import muebles.*
import academia.*
class Cosa {
    const property marca 
    const property volumen
    const property esMagico
    const property esReliquia
    
    method utilidad() {
        return volumen + self.valorSiEsMagico() + self.valorSiEsReliquia() + marca.aporte(self)
    }

    method valorSiEsMagico() {
        return if (esMagico) 3 else 0
    }

    method valorSiEsReliquia() {
        return if (esReliquia) 5 else 0
    }

}

object acme {

    method aporte(cosa) {
        return cosa.volumen() / 2 
    }

}

object fenix {
    
    method aporte(cosa) {
        return if (cosa.esReliquia()) 3 else 0
    }

}

object cuchuflito {

    method aporte(cosa) {
        return 0
    }

}