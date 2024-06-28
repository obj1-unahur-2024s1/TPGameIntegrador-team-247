import wollok.game.*
import globo.*
import elementos.*
import niveles.*
import pantallas.*

const ancho = 15
const alto = 30
const celda = 60

object juego{
	var nivel = nivel1
	
	method iniciar(){
		self.configuracionInicial()
		game.addVisual(pantallaInicio)
		keyboard.space().onPressDo{instrucciones1.configurar()}
	}
	
	method configuracionInicial(){
		game.title("Ballon Up")
		game.width(ancho)
		game.height(alto)
		game.cellSize(celda)
	}
	
	method configurar(){
		game.clear()
		nivel.configurar()
	}
	
	method pasarASiguienteNivel(){
		game.clear()
		sonidoAmbiente.pausar()
		game.addVisual(levelUp)
		nivel = nivel2
		keyboard.enter().onPressDo{self.configurar()}
	}
    
    method ganar(){
        game.clear()
        sonidoAmbiente.parar()
        game.sound("musica/sonidoGanar.mp3").play()
        game.addVisual(pantallaGanaste)
    }
    
    method gameOver(){
		game.clear()
		sonidoAmbiente.parar()
		game.sound("musica/gameOver.mp3").play()
		game.addVisual(gameover)
	}
	
	method reset(){
        contadorMonedas.reiniciar()
        vidas.reiniciar()
    }
}

object sonidoAmbiente{
	const sonido = game.sound("musica/musicaAmbiente.mp3")
	
	method sonar(){
		sonido.shouldLoop(true)
		game.schedule(1,{sonido.play()})
	}
	
	method configurar(){
		keyboard.v().onPressDo({sonido.volume(0.2)})
		keyboard.m().onPressDo({sonido.volume(1)})
	}
	
	method parar(){
		sonido.stop()
	}
	
	method pausar(){
		sonido.pause()
	}
	
	method resumir(){
		sonido.resume()
	}
}

object vidas{
	const position = game.at(11, 28.5)
	var vidas = 3
	
	method position() = position
	
	method image(){
		if (vidas == 3)
			return "vidas/3Vidas.png"
		else if (vidas == 2)
			return "vidas/2Vidas.png"
		else
			return "vidas/1Vida.png"	
	}
	
	method perderVida(cuantas){
		vidas = 0.max(vidas-cuantas)
		if (vidas == 0)
			juego.gameOver()
	}
	
	method reiniciar(){
		vidas = 3
	}
}

object contadorMonedas{
	const position = game.at(1,28)
	var cantMoneda = 0
	
	method position() = position
	method image() = "contador/"+cantMoneda.toString()+".png"
	
	method conseguirMoneda(){
		cantMoneda += 1	
	}
	
	method cantidadMonedas() = cantMoneda
	
	method restarMonedas(cantidad){
		cantMoneda = 0.max(cantMoneda-cantidad)
	}
		
    method reiniciar(){
        cantMoneda = 0
    }
}