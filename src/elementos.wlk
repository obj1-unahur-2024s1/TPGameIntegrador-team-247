import wollok.game.*
import globo.*
import juego.*

class Elementos{
	var position = self.posicionAleatoria()
	
	method position() = position
	method image() = null
	method posicionAleatoria() = game.at(0.randomUpTo(game.width()-1).truncate(0), game.height()-5)
	
	method aparecer(){
		if (game.getObjectsIn(self.position()).isEmpty())
			game.addVisual(self)
			game.onTick(100, self.identity().toString(), {self.bajar()})
	}
	
	method bajar(){
		if (position.y() < 4){
        	game.removeTickEvent(self.identity().toString())
        	self.removerVisualSiHay()
        	}
        else{
        	position = position.down(1)
        	}
   }
   
   method removerVisualSiHay(){
   		if (game.hasVisual(self))
   			game.removeVisual(self)	
   }
   
   method chocarGlobo()
}


class Nube inherits Elementos{
	
	override method image() = "nube.png"
	
	override method chocarGlobo(){
		contadorMonedas.restarMonedas(2)
	}
}

class NubeLluvia inherits Elementos{
	
	override method image() = "nubeLluvia.png"
	
	override method chocarGlobo(){
		contadorMonedas.restarMonedas(5)
		vidas.perderVida(1)
	}
}

class Moneda inherits Elementos{
	
	override method image() = "moneda.png" 
	
	override method chocarGlobo(){
		game.sound("musica/sonidoMoneda.mp3").play()
		contadorMonedas.conseguirMoneda()
		game.removeVisual(self)
	}
}


class MeteoritoFuego inherits Elementos{
	
	override method image() = "meteorito.png"
	
	override method chocarGlobo(){
		juego.gameOver()
	}
	
}

class Meteorito inherits Elementos{
	override method image() = "meteoritoSinFuego.png"
	
	override method chocarGlobo(){
		contadorMonedas.restarMonedas(10)
		vidas.perderVida(1)
	}
}

class NubeRayo inherits Elementos{
	
	override method image() = "nubeConRayo.png"
	
	override method chocarGlobo(){
		contadorMonedas.restarMonedas(5)
	}
}