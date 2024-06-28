import wollok.game.*
import juego.*
import elementos.*
import globo.*
import pantallas.*

class Nivel{
	
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
	}
	
	method generarObstaculos()
	method agregarFondo()
	method ganar()
}


object nivel1 inherits Nivel{
	
	override method agregarFondo(){
		game.addVisual(pantallaNivel1)
		sonidoAmbiente.sonar()
	}
	
	override method generarObstaculos(){
		game.onTick(600, "generacion nubes", {new Nube().aparecer()})
		game.onTick(1200, "generacion nubesLluvia", {new NubeLluvia().aparecer()})
	}
	
	override method generarMonedas(){
		super()
		game.onTick(10, "contador monedas", {if (contadorMonedas.cantidadMonedas() == 15) self.ganar()})
	}
	
	override method ganar(){
		juego.pasarASiguienteNivel()
	}	
}


object nivel2 inherits Nivel{

	override method configurar(){
		juego.reset()
		super()
	}
	
	override method agregarFondo(){
		game.addVisual(pantallaNivel2)
		sonidoAmbiente.resumir()
	}
	
	override method generarObstaculos(){
		game.onTick(600, "generacion nubeRayo", {new NubeRayo().aparecer()})
		game.onTick(1200, "generacion meteoritoFuego", {new MeteoritoFuego().aparecer()})
		game.onTick(900, "generacion meteoritoSinFuego", {new Meteorito().aparecer()})
	}
	
	override method generarMonedas(){
		super()
		game.onTick(10, "contador monedas", {if (contadorMonedas.cantidadMonedas() == 30) self.ganar()})
	}
	
	override method ganar(){
		juego.ganar()
	}
}	

