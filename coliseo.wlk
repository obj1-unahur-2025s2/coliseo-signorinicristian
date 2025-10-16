object coliseo {
    method curarGladiadores(unGrupo) {
        unGrupo.curarATodos()
    }

    method curarGladiador(unGladiador) {
        unGladiador.sanar()
    }

    method combate(unGrupo, otroGrupo) {
        unGrupo.combatir(otroGrupo)
    }

    method combateInjusto(unGrupo, unGladiador) {
        unGrupo.combatirUnGladiador(unGladiador)
    }
}