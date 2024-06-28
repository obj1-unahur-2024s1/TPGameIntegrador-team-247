import wollok.game.*

object globo{
	var position = game.at(game.width()/2, 5)
	
	method image() = "globo.png"
	method position() = position
	
	method configurar(){
		game.addVisual(self)
		keyboard.right().onPressDo{self.moverDerecha()}
		keyboard.left().onPressDo{self.moverIzquierda()}
	}
	
	method moverDerecha(){
		if (position.x() < game.width()-1)
			position = position.right(1)
	}
	
	method moverIzquierda(){
		if (position.x() > 0)
			position = position.left(1)
	}	
}