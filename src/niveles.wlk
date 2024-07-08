import wollok.game.*
import juego.*
import elementos.*
import globo.*
import pantallas.*

class Nivel1{

    method configurar(){
        juego.configuracionInicial()
        sonidoAmbiente.configurar()
        self.agregarFondo()
        self.configurarVisuales()
        self.generarMonedas()
        self.generarObstaculos()
        game.onCollideDo(globo, {g => g.chocarGlobo()})
    }

    method configurarVisuales(){
        globo.configurar() 
        game.addVisual(vidas) 
        game.addVisual(contadorMonedas) 
    } 

    method generarMonedas(){
        game.onTick(2000, "generacion monedas", {new Moneda().aparecer()})
        game.onTick(10, "contador monedas", {if (contadorMonedas.cantidadMonedas() == self.cantidad()) self.ganar()})
    }

    method agregarFondo(){
        game.addVisual(pantallaNivel1)
        sonidoAmbiente.sonar()
    }

    method generarObstaculos(){
        game.onTick(600, "generacion nubes", {new Nube().aparecer()})
        game.onTick(1200, "generacion nubesLluvia", {new NubeLluvia().aparecer()})
    }

    method cantidad() = 10

    method ganar(){
        juego.pasarASiguienteNivel()
    }
}

object nivel2 inherits Nivel1{

    override method configurar(){
        juego.reset()
        super()
    }

    override method agregarFondo(){
        game.addVisual(pantallaNivel2)
        sonidoAmbiente.resumir()
    }

    override method generarObstaculos(){
        game.onTick(500, "generacion nubeRayo", {new NubeRayo().aparecer()})
        game.onTick(1100, "generacion meteoritoFuego", {new MeteoritoFuego().aparecer()})
        game.onTick(800, "generacion meteoritoSinFuego", {new Meteorito().aparecer()})
    }

    override method cantidad() = 20

    override method ganar(){
        juego.ganar()
    }
}



