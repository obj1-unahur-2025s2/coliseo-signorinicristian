import gladiadores.*

class Grupo {
    const nombre = ""

    var peleas = 0 

    const gladiadores = #{}

    const gladiadoresVivos = gladiadores.filter({g => g.estaVivo()})

    method nombre() = nombre

    method hayGladiadorVivo() = gladiadores.any({g => g.estaVivo()})

    method campeon() = gladiadoresVivos.max({g => g.fuerza()})

    method agregarGladiador(unGladiador) {
        gladiadores.add(unGladiador)
    }

    method quitarGladiador(unGladiador) {
        gladiadores.remove(unGladiador)
    }

    method combatir(otroGrupo) {
        (1 .. 3).forEach({n => 
            if(self.hayGladiadorVivo() && otroGrupo.hayGladiadorVivo()) {
                self.campeon().pelearCon(otroGrupo.campeon())
                peleas += 1
            }            
        })
    }

    method combatirUnGladiador(unGladiador) {
        (1 .. 3).forEach({n => 
            if(self.hayGladiadorVivo() && unGladiador.estaVivo()) {
                self.campeon().pelearCon(unGladiador)
                peleas += 1
            }
        })
    }

    method curarATodos() {
        gladiadores.forEach({g => g.sanar()})
    }
}

/*
const gladiadorUno = new Mirmillon()
const gladiadorDos = new Mirmillon()
const grupo1 = new Grupo(nombre = "grupo1", gladiadores = #{gladiadorUno, gladiadorDos})
*/