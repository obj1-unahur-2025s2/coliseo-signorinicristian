import armas.*
import piezasDeArmadura.*
import grupos.*

class Mirmillon {
    var salud = 100

    const arma 

    const fuerza

    var armadura

    method estaVivo() = salud > 0

    method poderDeAtaque() = fuerza + arma.ataque()

    method cambiarArmadura(nuevaArmadura) {
        armadura = nuevaArmadura
    }

    method defensa() = armadura.puntosDeArmadura(self) + self.destreza()

    method destreza() = 15

    method fuerza() = fuerza 

    method atacar(unGladiador) {
        if(self.estaVivo() && unGladiador.estaVivo()) {
            unGladiador.recibirDaño(self.poderDeAtaque() - unGladiador.defensa())
        }
    }

    method recibirDaño(unValor) {
        salud = (salud - unValor).max(0)
    }

    method pelearCon(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method grupoCon(unGladiador) {
        const grupo = new Grupo(
            nombre = "mirmillolandia",
            gladiadores = #{self, unGladiador}
        )

        return grupo
    }

    method sanar() {
        if(self.estaVivo()) {
            salud = 100   
        }
    }
}

class Dimachaerus {
    var salud = 100 

    const armas = []

    const fuerza = 10

    var destreza

    method estaVivo() = salud > 0

    method poderDeAtaque() = fuerza + armas.sum({a => a.poderDeAtaque()})

    method defensa() = destreza * 0.5

    method destreza() = destreza

    method fuerza() = fuerza

    method atacar(unGladiador) {
        if(unGladiador.estaVivo()) {
            unGladiador.recibirDaño(self.poderDeAtaque() - unGladiador.defensa())
            destreza += 1
        }
    }

    method recibirDaño(unValor) {
        salud = (salud - unValor).max(0)
    }

    method pelearCon(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method grupoCon(unGladiador) {
        const sumaDePoder = self.poderDeAtaque() + unGladiador.poderDeAtaque()

        const grupo = new Grupo(
            nombre = "D-" + sumaDePoder.toString(),
            gladiadores = #{self, unGladiador}
        )

        return grupo
    }
}