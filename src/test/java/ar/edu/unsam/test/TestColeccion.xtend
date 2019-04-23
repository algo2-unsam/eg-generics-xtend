package ar.edu.unsam.test

import ar.edu.unsam.Auto
import ar.edu.unsam.Coleccion
import ar.edu.unsam.Figurita
import java.time.LocalDate
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestColeccion {

	Coleccion<Figurita> albumFiguritas
	Coleccion<Auto> coleccionDeAutos

	@Before
	def void init() {

		albumFiguritas = new Coleccion<Figurita>() => [
			setCantidadObjetivo = 2
		]
		
		coleccionDeAutos = new Coleccion<Auto>() => [
			setCantidadObjetivo = 1
		]

		albumFiguritas.agregarElemento(
			new Figurita => [
				esHolograma = true
			]
		)
		
		coleccionDeAutos.agregarElemento(
			new Auto => [
				fechaLanzamiento = LocalDate.of(1929, 12, 31)
			]
		)

	}

	@Test
	def testColeccionCompleta() {
		albumFiguritas.agregarElemento(new Figurita)
		Assert.assertTrue(albumFiguritas.estaCompleta)
		
	}

	@Test
	def testColeccionNoCompleta() {
		Assert.assertFalse(albumFiguritas.estaCompleta)
	}

	@Test
	def testColeccionFiguritasValiosa() {
		albumFiguritas.agregarElemento(new Figurita)
		Assert.assertTrue(albumFiguritas.esValiosa)
	}
	
	@Test
	def testColeccionFiguritasNoValiosa() {
		albumFiguritas.setCantidadObjetivo = 3
		albumFiguritas.agregarElemento(new Figurita)
		albumFiguritas.agregarElemento(new Figurita)
		Assert.assertFalse(albumFiguritas.esValiosa)
	}
	
	@Test
	def testColeccionAutosValiosa() {
		Assert.assertTrue(coleccionDeAutos.esValiosa)
	}

}
