package ar.edu.unsam.test

import ar.edu.unsam.Auto
import ar.edu.unsam.Coleccion
import java.time.LocalDate
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

class TestColeccionAutos {

	Coleccion<Auto> coleccionAutos

	@BeforeEach
	def void init() {
		coleccionAutos = new Coleccion<Auto>() => [cantidadObjetivo = 3]
		coleccionAutos.agregarElemento(new Auto => [fechaLanzamiento = LocalDate.of(1929, 12, 31)])
	}

	@Test
	@DisplayName("Colección de autos incompleta no es valiosa")
	def testColeccionAutosNoValiosa() {
		assertFalse(coleccionAutos.esValiosa)
	}

	@Test
	@DisplayName("Colección de autos completa y con más de la mitad de elementos raros es valiosa")
	def testColeccionAutosValiosa() {
		coleccionAutos.agregarElemento(new Auto => [fechaLanzamiento = LocalDate.of(1930, 01, 01)])
		coleccionAutos.agregarElemento(new Auto => [fechaLanzamiento = LocalDate.of(1928, 01, 01)])
		assertTrue(coleccionAutos.esValiosa)
	}

}
