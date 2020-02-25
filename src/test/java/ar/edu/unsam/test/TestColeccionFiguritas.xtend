package ar.edu.unsam.test

import ar.edu.unsam.Coleccion
import ar.edu.unsam.Figurita
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

class TestColeccionFiguritas {

	Coleccion<Figurita> coleccionFiguritas

	@BeforeEach
	def void init() {
		coleccionFiguritas = new Coleccion<Figurita>() => [cantidadObjetivo = 2]
		coleccionFiguritas.agregarElemento(new Figurita => [esHolograma = true])
	}

	@Test
	@DisplayName("Colección con cantidad de elementos menor a la cantidad objetivo no está completa")
	def testColeccionNoCompleta() {
		assertFalse(coleccionFiguritas.estaCompleta)
	}

	@Test
	@DisplayName("Colección con cantidad de elementos igual a la cantidad objetivo está completa")
	def testColeccionCompleta() {
		coleccionFiguritas.agregarElemento(new Figurita)
		assertTrue(coleccionFiguritas.estaCompleta)

	}

	@Test
	@DisplayName("Colección de figuritas completa y con la mitad de elementos raros es valiosa")
	def testColeccionFiguritasValiosa() {
		coleccionFiguritas.agregarElemento(new Figurita)
		assertTrue(coleccionFiguritas.esValiosa)
	}

	@Test
	@DisplayName("Colección de figuritas completa con menos de la mitad de elementos raros no es valiosa")
	def testColeccionFiguritasNoValiosa() {
		coleccionFiguritas.cantidadObjetivo = 3
		coleccionFiguritas.agregarElemento(new Figurita)
		coleccionFiguritas.agregarElemento(new Figurita)
		assertFalse(coleccionFiguritas.esValiosa)
	}

}
