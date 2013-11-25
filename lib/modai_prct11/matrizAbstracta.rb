# Clase abstracta para herencia común de matrices densa y dispersa
require './lib/modai_prct11/racional.rb'

class MatrizAbstracta
$tope = 9999999999.9
	# Inicialización
	def initialize(matriz)
		@matriz = matriz
		@filas = matriz[0].size
		@columnas = matriz[0].size

	end
end
