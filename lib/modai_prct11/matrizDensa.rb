#= Clase de Matriz densa
class MatrizDensa < MatrizAbstracta

	#== Inicialización
	def initialize(matriz)
		super
	end

	attr_reader :matriz, :filas, :columnas

	#== Convertimos a string
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

	#==  Matriz en punto flotante
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

	#== Suma de matrices
	def +(o)
	
		if o.instance_of? MatrizDispersa
			other = to_densa(o)
		else
			other = o
		end
		
		suma = Array.new(matriz.size - 1)

		0.upto(matriz.size - 1) do |i|
		   	suma[i] = Array.new(matriz[i].size - 1)

#			0.upto(matriz[i].size - 1) do |j|
			
			j = 0
			(0...(matriz[i].size)).collect {

				suma[i][j] = matriz[i][j] + other.matriz[i][j]
				j += 1

			}

#			end

		end
		MatrizDensa.new(suma)

	end

        #== Suma de matrices densa con dispersa (sobreescribimos el operador / como prueba)
        def /(o)

                suma = Array.new(matriz.size - 1)

		0.upto(matriz.size - 1) do |i|
                        suma[i] = Array.new(matriz[i].size - 1)

			0.upto(matriz[i].size - 1) do |j|
			
				suma[i][j] = matriz[i][j]
					
				#=== comprobamos el hash
	                        if (o.matriz[i] != nil)
					
					#=== hay datos en el has para la columna
					if o.matriz[i].has_key?(j)						
                                		suma[i][j] = matriz[i][j] + o.matriz[i][j]
					end
					
				end

                        end
                end
                MatrizDensa.new(suma)

        end


	#== Resta de matrices
	def -(o)

                resta = Array.new(matriz.size - 1)

		0.upto(matriz.size - 1) do |i|
			resta[i] = Array.new(matriz[i].size - 1)

			0.upto(matriz[i].size - 1) do |j|
				resta[i][j] = matriz[i][j] - o.matriz[i][j]
			end
                end
                MatrizDensa.new(resta)

	end

	#== Multiplicación de matrices
	def *(o)

		prod = Array.new(matriz.size - 1,0)
 
		0.upto(matriz[0].size - 1) do |i|
			prod[i] = Array.new(o.matriz.size,0)

			(o.matriz.size).times do |j|

				pos = 0
#				0.upto(matriz.size - 1) do |pos|
				(0...(matriz.size)).collect {
					prod[i][j] = prod[i][j] + (matriz[i][pos] * o.matriz[pos][j])
					pos += 1
				}
#				end

			end
		end
		MatrizDensa.new(prod)

	end

	#== Máximo de matriz
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

	#== Minimo de matriz
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

        #== Pasamos de Dispersa a Densa
        def to_densa(o)

                densa = Array.new(o.matriz.size - 1)
                for i in 0...o.matriz.size
                        densa[i] = Array.new(o.matriz.size - 1)
                        for j in 0...o.matriz.size
                                densa[i][j] = 0.to_f
                                if o.matriz[i] != nil
                                        o.matriz[i].each do |key, value|
                                                if key = j
                                                        densa[i][j] = o.matriz[i][key].to_f
                                                end
                                        end
                                end
                        end
                end

                MatrizDensa.new(densa)

        end

	#== El metodo coerce para onvierte el valor especificado en el tipo especificado.
	def coerce(other)
		return self, other
 	end


	#== Devolvemos la posición del primer elemento cuyo cuadrado es mayor a 6
	def encontrar	
	
		valor = "["

                0.upto(matriz.size - 1) do |i|

                        (matriz[i].size).times do |j| 
                                
	         		if (yield(matriz[i][j])) 
	         		
					valor += "[#{i},#{j}]"

		         	end

                        end
                end

       		valor += "]"

		valor

	end

end

