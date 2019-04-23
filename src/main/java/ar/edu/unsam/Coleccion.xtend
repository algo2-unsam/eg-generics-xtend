package ar.edu.unsam

import java.util.HashSet
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Coleccion<T extends Coleccionable> {

	Set<T> elementos = new HashSet()
	Integer cantidadObjetivo

	def agregarElemento(T elemento) {
		elementos.add(elemento)
	}

	def estaCompleta() {
		elementos.length >= cantidadObjetivo
	}

	def esValiosa() {
		mayoriaElementosRaros && estaCompleta
	}

	def mayoriaElementosRaros() {
		elementos.filter[esRaro].length >= elementos.length / 2.0
	}

}
