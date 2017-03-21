


class A5
      attr_accessor :R1, :R2 , :R3, :SecC

      def initialize(r1,r2,r3)

      	  if r1.length == 19 && r2.length==22 && r3.length == 23 then
      	         @R1 = r1
      	         @R2 = r2
       	         @R3 = r3
       	         @SecC =  []
      	  else
      	        puts "ELEMNETOS DE REGISTRO INTRODUCIDO INCORRECTAMENTE."
      	  end
      end
      def cifrado(mensaje)
        
            mensajeBin = mensaje 
            mensajeBin= stringPasaBinario(mensaje)
            # genero mi secuencia cifrante.
            algoritmo(mensajeBin.size )
            puts "MAQUINA CIFRANDO" 
            puts "Mensaje en texto: " + mensaje
            puts "Codigo en binario del mensaje : " +  mensajeBin
           
            resul = xor(mensajeBin,@SecC)
            puts "Esta es mi secuencia cifrante : " + @SecC.to_s
            puts "Codigo en binario del mensaje cifrado : " +   resul
            resul
      end
      
      def cifradoB(mensaje)
        
            mensajeBin = mensaje 
            # mensajeBin= stringPasaBinario(mensaje)
            # genero mi secuencia cifrante.
            algoritmo(mensaje.size )
            puts "MAQUINA CIFRANDO" 
            puts "Mensaje en texto: " + mensaje.to_s
            puts "Codigo en binario del mensaje : " +  mensajeBin.to_s
           
            resul = xor(mensajeBin,@SecC)
            puts "Esta es mi secuencia cifrante : " + @SecC.to_s
            puts "Codigo en binario del mensaje cifrado : " +   resul
            resul
      end
      
      def descifrar(codigoCifrado)
            puts "MAQUINA DESCIFRANDO" 
            @SecC = ""
            algoritmo(codigoCifrado.size )
            a = xor(codigoCifrado,@SecC )
            puts "Codigo en binario al decifrado : " + a 
            resul = binarioPasaString(a)
            puts "Codigo en texto a decifrado: " + resul.to_s 
      end
      
      
      
      
      def imprimir()
           cab = ""
           23.times{ |i|
               if i < 9 then
                    cab =  "   #{i+1} |" + cab
               else
                     cab =  "  #{i+1} |" + cab
               end
           }
           puts "VER REGISTOS: \n"
           puts "R. |" + cab
           puts "-" * 145
          
          sacar = []
          @R1.reverse_each{ |i|  sacar <<  i }
          puts "R1 |" + ("     |"* 4) + "  " + sacar.join("  |  ") + "  |"

          sacar = []
          @R2.reverse_each{ |i|  sacar <<  i }
          puts "R2 |" + ("     |  ") + sacar.join("  |  ") + "  |"
          
          sacar = []
          @R3.reverse_each{ |i|  sacar <<  i }
          puts "R3 |  " + sacar.join("  |  ") +"  |"
          puts "-" * 145
      end

      #Se le pasa un bit 0 o uno y devuelve el bit mayoria
      def funcionMayoria(a,b,c)
            # el valor que coincide en los tres.
           if a == b || a == c then
                 return a
           else
                 return b
           end
      end

      def algoritmo(n)
          
   n.times{  

           cab = ""
           23.times{ |i|
               if i < 9 then
                    cab =  "   #{i+1} |" + cab
               else
                     cab =  "  #{i+1} |" + cab
               end
           }
           puts "z = " + @R1[18].to_s +  @R2[21].to_s  + @R3[22].to_s + " = " + "#{((@R1[18]^ @R2[21])^@R3[22])}"
           puts "VER REGISTOS: \n"
           puts "R. |" + cab
           puts "-" * 145
      
          
        
               # introduceSeccionCifrante
             
             
               
               
               @SecC << ((@R1[18]^ @R2[21])^@R3[22])
                # imprimir()
              # p @SecC
                   
               # F(a9,b11,c11) = 0
              mayor = funcionMayoria(@R1[8],@R2[10],@R3[10])
             #p "mayor " + mayor.to_s
              

              if @R1[8] == mayor then

                        sacar = []
                        @R1.reverse_each{ |i|  sacar <<  i }
                        puts "R1 |" + ("  <- |"* 4) + "  " + sacar.join("  |  ") + "  | #{xorR1}" 

                        
                        desplazaR1(xorR1)
                        
                   
                         sacar = []
                        @R1.reverse_each{ |i|  sacar <<  i }
                        puts "R1 |" + ("     |"* 4) + "  " + sacar.join("  |  ") + "  |"
             else
                       sacar = []
                        @R1.reverse_each{ |i|  sacar <<  i }
                        puts "R1 |" + ("     |"* 4) + "  " + sacar.join("  |  ") + "  |"

             end

              if @R2[10] == mayor then

                        sacar = []
                        @R2.reverse_each{ |i|  sacar <<  i }
                        puts "R2 |" + ("   <-|  ") + sacar.join("  |  ") + "  | #{xorR2}" 
                     
                        desplazaR2(xorR2)

                        sacar = []
                        @R2.reverse_each{ |i|  sacar <<  i }
                        puts "R2 |" + ("     |  ") + sacar.join("  |  ") + "  |"
             else
                 
                        sacar = []
                        @R2.reverse_each{ |i|  sacar <<  i }
                        puts "R2 |" + ("     |  ") + sacar.join("  |  ") + "  |"
              end

              if @R3[10] == mayor then
                      
                      sacar = []
                      @R3.reverse_each{ |i|  sacar <<  i }
                      puts "R3 |  " + sacar.join("  |  ") +"  | #{xorR3}"
                     
                      
                      
                      desplazaR3(xorR3)

                      sacar = []
                      @R3.reverse_each{ |i|  sacar <<  i }
                      puts "R3 |  " + sacar.join("  |  ") +"  |"
             else
                  sacar = []
                      @R3.reverse_each{ |i|  sacar <<  i }
                      puts "R3 |  " + sacar.join("  |  ") +"  |"

              end
               puts "-" * 145
          
          }
          p "z = #{@SecC.join}" 

      end

      def xorR1
            #13 16 17 18 
            total = ((((@R1[18]^ @R1[17])   ^ @R1[16])  ^ @R1[13])^1)
            total
      end
      
      def xorR2
            #20 21
            total = (@R2[21]^ @R2[20])^1
            total
      end
      
      def xorR3
            #22 21 20 7
            total =@R3[22]^ @R3[21]^ @R3[20]^ @R3[7]^1
            total
      end

      def desplazaR1(dato)
            @R1.pop
            nuevo = [dato]
            @R1 = nuevo +  @R1
           # p @R1
      end
      
      def desplazaR2(dato)
          
           #p @R2
            @R2.pop
            # p @R2
            nuevo = [dato]
            @R2 = nuevo +  @R2
            #p @R2
      end
      
      def desplazaR3(dato)
            @R3.pop
            nuevo = [dato]
            @R3 = nuevo +  @R3
           # p @R3
      end
 
        #Siempre se le pasan dos datos en binario de caracter del mismo tamaño
        def xor(datoA,datoB)
            resul = ""
            
            tam = datoA.length - 1
                
            for i in 0..tam do
                #resul << (datoA[i].to_i ^ datoB[i].to_i).to_s(2)
                resul << (datoA[i].to_i ^ datoB[i].to_i).to_s
            end
            
            return resul
        end
        
        #mete cadena de simbolos
    def stringPasaBinario(cadena)
            binario = ""
            cadena.bytes do |c|
                # 32 es el espacio Se pone un 0 para que se de 8 bit
                if( c != 32) then
                    binario << "0" + c.to_s(2)
                else
                    binario << "00" + c.to_s(2)
                end 
            end
           
            return binario
    end
    
       #Pasamos un cadena de 0 y 1
    def binarioPasaString(cadena)
            letra = ""
            i = 0
            aux =""
           
            cadena.bytes do |c|
                # 32 es el espacio Se pone un 0 para que se de 8 bit
                i = i + 1
                if( i==8) then
                    aux << c
                    letra << aux.to_i(2).chr
                    aux =""
                    i=0
                elsif 
                
                     aux << c
                
                end
            
                # binario << "0" + c.to_s(2)
            end
            return letra
    end
        
end