
require './lib/modai_prct11/racional.rb'
# = ejemplo_rdoc.rb
#
#Autor::   Dailos Herrera Bencomo and Mahrach Mohammed
# Web::    https://github.com/alu0100036862/prct11
#
# == MATRIZ## Con est clase pretendemos:
# - Poder trabajar con matrices de numeros interos y racionales.
# - Poder realizar operaciones entre diferentes tipo matrices y de diferentes argumentos.
# - Establecer relaciones de herencia entre las clases de tipo matrices partiendo de la ## === Clase Matriz abstracta
# - y hacer dos ejemplo de herencia en ste caso ## === Clase Matriz Dispersa y ## === Clase Matriz Densa
#
# Definición de las clases _Matriz_ _MatrizDensa_ y _MatrizDispersa_compuesta por la definición de
# * metodo initialize# * que heredarán las cvlases hijas y sobreescribir cuando es necesario
#
#
# - *rdoc*

#= Clase abstracta para herencia común de matrices densa y dispersa
class MatrizAbstracta
$tope = 9999999999.9
	# Inicialización
	def initialize(matriz)
		@matriz = matriz
		@filas = matriz[0].size
		@columnas = matriz[0].size

	end
end
