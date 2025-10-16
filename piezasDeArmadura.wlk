object casco {
    method puntosDeArmadura(unGladiador) = 10
}

object escudo {
    method puntosDeArmadura(unGladiador) = 5 + unGladiador.destreza() * 0.1
}
