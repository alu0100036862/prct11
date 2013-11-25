require "modai_prct11/version"
require "racional"

module ModaiPrct11

$tope = 9999999999.9
  
# Clase abstracta para herencia común de matrices densa y dispersa
class MatrizAbstracta

end

# Clase de Matriz densa
class MatrizDensa < MatrizAbstracta

	# Inicialización
	def initialize(matriz)

		@matriz = matriz
		@filas = matriz[0].size
		@columnas = matriz[0].size

	end

	attr_reader :matriz, :filas, :columnas

	# Convertimos a string
	def to_s

		fil = 0
		print "["
		while fil < filas

			col = 0					
			while col < columnas

				print "#{matriz[fil][col].to_s}"
				if (col + 1) < columnas then print ", " end
				col += 1

			end

			if (fil + 1) < filas then print ", " end
			fil += 1

		end
		print "]"

	end

	#  Matriz en punto flotante
	def to_f

                flotante = Array.new(matriz.size - 1)
                for i in 0...matriz.size
                        flotante[i] = Array.new(matriz[i].size - 1)
                        for j in 0...matriz[i].size
                                flotante[i][j] = (matriz[i][j]).to_f
                        end
                end
                MatrizDensa.new(flotante)

	end

	# Suma de matrices
	def +(o)

		suma = Array.new(matriz.size - 1)
#		for i in 0...matriz.size
		0.upto(matriz.size - 1) do |i|
		   	suma[i] = Array.new(matriz[i].size - 1)
#			for j in 0...matriz[i].size
			0.upto(matriz[i].size - 1) do |j|
				suma[i][j] = matriz[i][j] + o.matriz[i][j]
			end
		end
		MatrizDensa.new(suma)

	end

        # Suma de matrices densa con dispersa (sobreescribimos el operador / como prueba)
        def /(o)

                suma = Array.new(matriz.size - 1)
#		for i in 0...matriz.size
		0.upto(matriz.size - 1) do |i|
                        suma[i] = Array.new(matriz[i].size - 1)
#			for j in 0...matriz[i].size
			0.upto(matriz[i].size - 1) do |j|
			
				suma[i][j] = matriz[i][j]
					
				# comprobamos el hash
	                        if (o.matriz[i] != nil)
					
					# hay datos en el has para la columna
					if o.matriz[i].has_key?(j)						
                                		suma[i][j] = matriz[i][j] + o.matriz[i][j]
					end
					
				end

                        end
                end
                MatrizDensa.new(suma)

        end


	# Resta de matrices
	def -(o)

                resta = Array.new(matriz.size - 1)
#		for i in 0...matriz.size
		0.upto(matriz.size - 1) do |i|
			resta[i] = Array.new(matriz[i].size - 1)
#			for j in 0...matriz[i].size
			0.upto(matriz[i].size - 1) do |j|
				resta[i][j] = matriz[i][j] - o.matriz[i][j]
			end
                end
                MatrizDensa.new(resta)

	end

	# Multiplicación de matrices
	def *(o)

		prod = Array.new(matriz.size - 1,0)
#		for i in 0...matriz[0].size 
		0.upto(matriz[0].size - 1) do |i|
			prod[i] = Array.new(o.matriz.size,0)
#			for j in 0...o.matriz.size
			0.upto(o.matriz.size - 1) do |j|
#				for pos in 0...matriz.size
				0.upto(matriz.size - 1) do |pos|
					prod[i][j] = prod[i][j] + (matriz[i][pos] * o.matriz[pos][j])
				end
			end
		end
		MatrizDensa.new(prod)

	end

	# Máximo de matriz
	def max

		maximo = 0.to_f
		for i in 0...matriz.size
			for j in 0...matriz[i].size
				if matriz[i][j].to_f > maximo
					maximo = matriz[i][j].to_f
				end
			end
		end
		maximo

	end

	# Minimo de matriz
	def min

		minimo = $tope
		for i in 0...matriz.size
			for j in 0...matriz[i].size
				if matriz[i][j].to_f < minimo
					minimo = matriz[i][j].to_f
				end
			end
		end
		minimo

	end

	# Añadimos el coerce
	def coerce(other)
		return self, other
 	end

end

# Clase de Matriz dispersa
class MatrizDispersa < MatrizAbstracta

	# Inicialización
        def initialize(matriz)

                @matriz = matriz
                @filas = matriz.size
                @columnas = matriz.size

	end

	attr_reader :matriz, :filas, :columnas

	# Convertimos a string
	def to_s

                fil = 0
                print "["
                while fil < filas

			col = 0
			while col < columnas

                       		# Hay datos en la fila
                       		if matriz[fil] != nil

					if matriz[fil].has_key?(col)
						print "#{matriz[fil][col].to_s}"
                                        else
                                        	print "0"
					end 
				else
                                        print "0"
				end

	                       	if (col + 1) < columnas then print ", " end
        	                col += 1

			end


                        if (fil + 1) < filas then print ", " end
                        fil += 1

                end
                print "]"

	end

	#  Matriz en punto flotante
	def to_f

                flotante = Array.new(matriz.size - 1)
                for i in 0...matriz.size
			# Hay datos en la fila
                        if matriz[i] != nil
				
                        	flotante[i] = Hash.new()
                                matriz[i].each do |key, value|
					flotante[i][key] = matriz[i][key].to_f
                                end
			
			end

                end
                MatrizDispersa.new(flotante)

	end

	# Suma de matrices
	def +(o)

                suma = Array.new(matriz.size - 1)
                for i in 0...matriz.size
                      
			# creamos el hash
			if (matriz[i] != nil or o.matriz[i] != nil)

				suma[i] = Hash.new()
		
				case true

					# Los dos tienen hash
					when (matriz[i] != nil and o.matriz[i] != nil)
				
						# cogemos matriz como base para la suma
						suma[i] = matriz[i]

						o.matriz[i].each do |key, value|
				
							if suma[i].has_key?(key)
		                                        	suma[i][key] = suma[i][key] + o.matriz[i][key]
                		                        else
                                		                suma[i][key] = o.matriz[i][key]
		                                        end

                                		end

					# matriz tiene hash
					when matriz[i] != nil
						suma[i] = matriz[i]						
	
					# o hash
					when o.matriz[i] != nil
						suma[i] = o.matriz[i]


				end
			
			end

                end
                MatrizDispersa.new(suma)

	end

	# Resta de matrices
	def -(o)

                resta = Array.new(matriz.size - 1)
                for i in 0...matriz.size

                        # creamos el hash
                        if (matriz[i] != nil or o.matriz[i] != nil)

                                resta[i] = Hash.new()
                                        
                                case true

                                        # Los dos tienen hash
                                        when (matriz[i] != nil and o.matriz[i] != nil)
                                
                                                # cogemos matriz como base para la resta
                                                resta[i] = matriz[i]

                                                o.matriz[i].each do |key, value|
                                
                                                        if resta[i].has_key?(key)
                                                                resta[i][key] = resta[i][key] - o.matriz[i][key]
                                                        else
                                                                resta[i][key] = o.matriz[i][key] * -1
                                                        end

                                                end

                                        # matriz tiene hash
                                        when matriz[i] != nil
                                                resta[i] = matriz[i]                                             
        
                                        # o hash
                                        when o.matriz[i] != nil
						resta[i] = o.matriz[i]
						resta[i].each do |key, value|
							resta[i][key] =  resta[i][key] * -1
                                                end

                                end
                        
                        end

                end
                MatrizDispersa.new(resta)

	end

=begin
	# Multiplicación de matrices
	def *(o)

                prod = Array.new(matriz.size - 1,0)
                for i in 0...matriz.size

			if (o.matriz[i] != nil)

				aux = 0
				for j in 0...o.matriz.size

					if (matriz[j] != nil)

						if matriz[j].has_key?(i)

							# No existe hash en la fila
							if prod[j] != nil
								prod[j] = Hash.new()
							end

							aux = aux + (o.matriz[i][j] * matriz[j][i])	

						end

					end
				
				end
				if aux <> 0
					prod.merge!({"#{}" => "#{aux}"})	
				end

			end

#                                        prod[i][j] = prod[i][j] + (matriz[i][pos] * o.matriz[pos][j])
 

				
                end
                MatrizDispersa.new(prod)

	end

=end

	# Máximo de matriz
	def max

                maximo = 0.to_f
                for i in 0...matriz.size
                        # Hay datos en la fila
                        if matriz[i] != nil
                                matriz[i].each do |key, value|
                                        if matriz[i][key].to_f > maximo
                                                maximo = matriz[i][key].to_f
                                	end
				end                        
                        end
                end
                maximo

	end

	# Minimo de matriz
	def min

	        minimo = 0.to_f
                for i in 0...matriz.size			
			# Hay datos en la fila
			if matriz[i] != nil					
				matriz[i].each do |key, value|
                	               	if matriz[i][key].to_f < minimo
                        	               	minimo = matriz[i][key].to_f
                               		end
				end
                        end				
                end
                minimo

	end

	# Añadimos el coerce
	def coerce(other)
		return self, other
 	end

end

end

