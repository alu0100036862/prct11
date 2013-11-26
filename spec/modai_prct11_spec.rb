require 'spec_helper'
require 'modai_prct11'
include ModaiPrct11

describe ModaiPrct11 do

        before :each do

                #== Matrices DENSAS 
                matA = [[1,2],[3,4]]
                matB = [[221,2],[3,4]]

                matA_R = [[Racional.new(1,1),Racional.new(4,2)],[Racional.new(9,3),Racional.new(16,4)]]
                matB_R = [[Racional.new(442,2),Racional.new(4,2)],[Racional.new(9,3),Racional.new(16,4)]]

                @matrizA = MatrizDensa.new(matA)
                @matrizB = MatrizDensa.new(matB)

                @matrizA_R = MatrizDensa.new(matA_R)
                @matrizB_R = MatrizDensa.new(matB_R)
                                
                #== Matrices DISPERSAS
                matC = [nil, {1 => 4}] # [[0,0],[0,4]] 
                matD = [{0 => 5}, nil] # [[5,0],[0,0]]
                matE = [{0 => 1}, {1 => 2}, {2 => 3}, {3 => 4}] # [[1,0,0,0],[0,2,0,0],[0,0,3,0],[0,0,0,4]]
                matF = [{1 => 5, 3 => 4}, {1 => 2}, {0 => 3}, {2 => 1}] # [[0,5,0,4],[0,2,0,0],[3,0,0,0],[0,0,1,0]]

                matC_R = [nil, {1 => Racional.new(4,1)}] # [[Racional.new(0,1),Racional.new(0,1)],[Racional.new(0,1),Racional.new(4,1)]]
                matD_R = [{0 => Racional.new(5,1)}, nil] # [[Racional.new(5,1),Racional.new(0,1)],[Racional.new(0,1),Racional.new(0,1)]]

                @matrizC = MatrizDispersa.new(matC)
                @matrizD = MatrizDispersa.new(matD)
                @matrizE = MatrizDispersa.new(matE)
                @matrizF = MatrizDispersa.new(matF)

                @matrizC_R = MatrizDispersa.new(matC_R)
                @matrizD_R = MatrizDispersa.new(matD_R)

                #== Matrices creadas en horas de practicas
                matA_P_DEN = [[3.4],[5.6]]
                matB_P_DIS = [nil,{1 => 1}]
                matB_R_DIS = [nil,{1 => Racional.new(1,2)}]

                @matrizA_P_DEN = MatrizDensa.new(matA_P_DEN)
                @matrizB_P_DIS = MatrizDispersa.new(matB_P_DIS)
                @matrizB_R_DIS = MatrizDispersa.new(matB_R_DIS)

        end

        context 'comprobar los accessors (DENSA)' do

                it "Se debe invocar al metodo matriz() para obtener la matriz (DENSA)" do
                        @matrizA.respond_to?("matriz").should == true
                end
                
                it "Se debe invocar al metodo filas() para obtener el numero de filas (DENSA)" do
                        @matrizA.respond_to?("filas").should == true
                end

                it "Se debe invocar al metodo columnas() para obtener el numero de columnas (DENSA)" do
                        @matrizA.respond_to?("columnas").should == true
                end

                it "Se debe invocar al metodo matriz() para obtener la matriz de racionales (DENSA)" do
                        @matrizA_R.respond_to?("matriz").should == true
                end
                
                it "Se debe invocar al metodo filas() para obtener el numero de filas de matriz de racionales (DENSA)" do
                        @matrizA_R.respond_to?("filas").should == true
                end

                it "Se debe invocar al metodo columnas() para obtener el numero de columnas de matriz de racionales (DENSA)" do
                        @matrizA_R.respond_to?("columnas").should == true
                end

        end

        context 'Comprobar metodos de conversion (DENSA)' do

                it "Se debe mostrar la matriz (DENSA)" do
                        @matrizA.to_s.should == MatrizDensa.new([[1,2],[3,4]]).to_s
                end

                it "Se debe convertir a punto flotantes (DENSA)" do
                        @matrizA.to_f.to_s.should == MatrizDensa.new([[1.0,2.0],[3.0,4.0]]).to_s
                end

                it "Se debe mostrar la matriz de racionales (DENSA)" do
                        @matrizA_R.to_s.should == MatrizDensa.new([[Racional.new(1,1),Racional.new(4,2)],[Racional.new(9,3),Racional.new(16,4)]]).to_s
                end

        end

        context 'Comprobar las operaciones entre matrices (DENSA)' do

                it "Se debe poder sumar dos matrices (DENSA)" do
                        (@matrizA + @matrizB).to_s.should == MatrizDensa.new([[222,4], [6,8]]).to_s
                end
          
                it "Se debe poder restar dos matrices (DENSA)" do
                        (@matrizA - @matrizB).to_s.should == MatrizDensa.new([[-220,0], [0,0]]).to_s
                end
                
                it "Se debe poder multiplicar dos matrices (DENSA)" do
                        (@matrizA * @matrizB).to_s.should == MatrizDensa.new([[227,10], [675,22]]).to_s
                end
          
                it "Se debe poder sumar dos matrices de racionales (DENSA)" do
                        (@matrizA_R + @matrizB_R).to_s.should == MatrizDensa.new([[Racional.new(222,1),Racional.new(4,1)],[Racional.new(6,1),Racional.new(8,1)]]).to_s
                end

                it "Se debe poder restar dos matrices de racionales (DENSA)" do
                        (@matrizA_R - @matrizB_R).to_s.should == MatrizDensa.new([[Racional.new(-220,1),Racional.new(0,1)],[Racional.new(0,1),Racional.new(0,1)]]).to_s
                end

        end
        
        context 'Comprobar las operaciones de la propia matriz (DENSA)' do

                it "Se debe mostrar el max de la matriz (DENSA)" do
                        @matrizA.max == 4.0
                end
          
                it "Se debe mostrar el min de la matriz (DENSA)" do
                        @matrizA.min == 1.0
                end
                
                it "Se debe mostrar el max de la matriz de racionales (DENSA)" do
                        @matrizA_R.max == Racional.new(1,1)
                end
          
                it "Se debe mostrar el min de la matriz de racionales (DENSA)" do
                        @matrizA_R.min == Racional.new(16,4)
                end

        end
        
        context 'comprobar los accessors (DISPERSA)' do

                it "Se debe invocar al metodo matriz() para obtener la matriz (DISPERSA)" do
                        @matrizC.respond_to?("matriz").should == true
                end
                
                it "Se debe invocar al metodo filas() para obtener el numero de filas (DISPERSA)" do
                        @matrizC.respond_to?("filas").should == true
                end

                it "Se debe invocar al metodo columnas() para obtener el numero de columnas (DISPERSA)" do
                        @matrizC.respond_to?("columnas").should == true
                end

                it "Se debe invocar al metodo matriz() para obtener la matriz de racionales (DISPERSA)" do
                        @matrizC_R.respond_to?("matriz").should == true
                end
                
                it "Se debe invocar al metodo filas() para obtener el numero de filas de matriz de racionales (DISPERSA)" do
                        @matrizC_R.respond_to?("filas").should == true
                end

                it "Se debe invocar al metodo columnas() para obtener el numero de columnas de matriz de racionales (DISPERSA)" do
                        @matrizC_R.respond_to?("columnas").should == true
                end

        end

        context 'Comprobar metodos de conversion (DISPERSA)' do

                it "Se debe mostrar la matriz (DISPERSA)" do
                        @matrizC.to_s.should == MatrizDispersa.new([nil, {1 => 4}]).to_s
                end

                it "Se debe convertir a punto flotantes (DISPERSA)" do
                        @matrizC.to_f.to_s.should == MatrizDispersa.new([nil, {1 => 4.0}]).to_s
                end

                it "Se debe mostrar la matriz de racionales (DISPERSA)" do
                        @matrizC_R.to_s.should == MatrizDispersa.new([nil, {1 => Racional.new(4,1)}]).to_s
                end

        end

        context 'Comprobar las operaciones entre matrices (DISPERSA)' do


                it "Se debe poder sumar dos matrices (DISPERSA)" do
                        (@matrizC + @matrizC).to_s.should == MatrizDispersa.new([{0 => 5}, {1 => 4}]).to_s
                end
          
                it "Se debe poder restar dos matrices (DISPERSA)" do
                        (@matrizC - @matrizC).to_s.should == MatrizDispersa.new([{0 => -5}, {1 => 4}]).to_s
                end
          
                it "Se debe poder multiplicar dos matrices (DISPERSA)" do
                        (@matrizE * @matrizF).to_s.should == MatrizDispersa.new([{1 => 5, 3 => 4}, {1 => 4}, {0 => 9}, {2 => 4}]).to_s
                end

                it "Se debe poder sumar dos matrices de racionales (DISPERSA)" do
                        (@matrizC_R + @matrizC_R).to_s.should == MatrizDispersa.new([{0 => Racional.new(5,1)}, {1 => Racional.new(4,1)}]).to_s
                end

                it "Se debe poder restar dos matrices de racionales (DISPERSA)" do
                        (@matrizC_R - @matrizC_R).to_s.should == MatrizDispersa.new([{0 => Racional.new(-5,1)}, {1 => Racional.new(4,1)}]).to_s
                end
   
        end
        
        context 'Comprobar las operaciones de la propia matriz (DISPERSA)' do

                it "Se debe mostrar el max de la matriz (DISPERSA)" do
                        @matrizC.max == 4
                end
          
                it "Se debe mostrar el min de la matriz (DISPERSA)" do
                        @matrizC.min == 0
                end
                
                it "Se debe mostrar el max de la matriz de racionales (DISPERSA)" do
                        @matrizC_R.max == Racional.new(4,1)
                end
          
                it "Se debe mostrar el min de la matriz de racionales (DISPERSA)" do
                        @matrizC_R.min == Racional.new(0,1)
                end

        end

        context 'Comprobar modificacion en la hora de practica' do

                it "Se debe sumar matriz DENSA con DISPERSA" do
                        (@matrizA_P_DEN + @matrizB_P_DIS).to_s.should == MatrizDensa.new([[3,4], [5,7]]).to_s
                end

                it "Se debe sumar matriz DENSA con DISPERSA con racionales" do
                        (@matrizA_P_DEN / @matrizB_R_DIS).to_s.should == MatrizDensa.new([[3,4], [5,Racional.new(13,2)]]).to_s
                end

        end

end
