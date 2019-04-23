package ar.edu.unsam

import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors

interface Coleccionable {

	def boolean esRaro()

}

@Accessors
class Auto implements Coleccionable {

	LocalDate fechaLanzamiento

	override esRaro() {
		fechaLanzamiento.year < 1930
	}

}

@Accessors
class Figurita implements Coleccionable {

	boolean esHolograma = false

	override esRaro() {
		esHolograma
	}

}