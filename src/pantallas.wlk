import wollok.game.*
import globo.*
import elementos.*
import juego.*
import niveles.*


class Pantalla{
	const position = game.at(0,0)
	var image
	method position() = position
	method image() = image
}

const pantallaInicio = new Pantalla(image = "pantallas/pantallaInicio.png") 
const pantallaNivel1 = new Pantalla(image = "pantallas/fondoNivel1.jpg") 
const pantallaNivel2 = new Pantalla(image = "pantallas/fondoNivel2.jpg") 
const pantallaGanaste = new Pantalla(image = "pantallas/ganar.png")	
const gameover = new Pantalla(image = "pantallas/gameover.png")
const levelUp = new Pantalla(image = "pantallas/levelUp.jpg")

object instrucciones1 inherits Pantalla(image = "pantallas/instrucciones1.png"){
	method configurar(){
		game.clear()
		game.addVisual(self)
		keyboard.r().onPressDo{juego.configurar()}
		keyboard.enter().onPressDo{instrucciones2.configurar()}
	}
}

object instrucciones2 inherits Pantalla(image = "pantallas/instrucciones2.jpg"){
	method configurar(){
		game.clear()
		game.addVisual(self)
		keyboard.enter().onPressDo{juego.configurar()}
	}
}