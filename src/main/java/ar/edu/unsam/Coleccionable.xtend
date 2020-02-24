package ar.edu.unsam

import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors

interface Coleccionable {

	def boolean esRaro()

}

@Accessors
class Auto implements Coleccionable {
	
	static Integer MAX_ANIO_RARO = 1930

	LocalDate fechaLanzamiento = LocalDate.now

	override esRaro() {
		fechaLanzamiento.year < MAX_ANIO_RARO
	}

}

@Accessors
class Figurita implements Coleccionable {

	boolean esHolograma = false

	override esRaro() {
		esHolograma
	}

}