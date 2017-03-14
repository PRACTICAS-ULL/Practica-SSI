
class Rc4 
    attr_accessor :S, :K , :Key_string ,:Cifrado 
    
    def initialize(clave)
        @S = (0..255).step(1).to_a
        @K = (0..255).map{ |i| clave[i%clave.length]}
        @Key_string = []
        @Cifrado = []
    end 
    
    def nuevaClave(clave)
        @S = (0..255).step(1).to_a
        @K = (0..255).map{ |i| clave[i%clave.length]}
    end 
    
    def cifrado(mensaje)
        algoritmoKSA
        return prga(mensaje)
    end
    
    def descifrando
        des =[]
        
        puts "\n\nDescifrando"
        puts "Mi Clave: " + @Key_string.to_s 
        puts "Mi Cifrado es: " + @Cifrado.to_s 
        
       
        des= xor(@Key_string,@Cifrado)
        
        puts "Mensaje original:" + des.to_s  
        return des   
    end
    
    
    def algoritmoKSA
       datos =""
       f = 0
   
       (0..255).map{ |i| 
        
          datos = "S[#{i}]= #{@S[i]} k[#{i}]= #{@K[i]} produce f= #{f}" 
          
          f= (f+ @S[i] + @K[i])% 256 ;
        
          # intercambio    
          @S[i],@S[f] = @S[f],@S[i]
          
          
          datos = datos + " y S[#{i}]= #{@S[i]} S[#{f}]=#{@S[f]}\n"
          puts datos
          datos = ""

        }
       puts "S = #{@S}"
    end
    
    def prga(mensaje)
        puts "Generación de secuenci cifrante y texto cifrado: "
        i = 0; f = 0;
       
       
        salida=""
        entrada=""
        #Generar cada byte de secuencia con:
        x = 0
       mensaje.length.times do

            i = (i + 1) % 256;
          
          
            f = (f + @S[i]) % 256;
            
            
            salida = "Byte #{i} de secuencia cifrante: "
            entrada = "Byte #{i} de texto original: "
            texcifra = "Byte #{i} de texto cifrado: "
            # intercambio    
            @S[i],@S[f] = @S[f],@S[i]
            
            
            t = (@S[i] + @S[f]) % 256;
          
            salida << "Salida= S[#{t}] = #{@S[t]}           "
            salida << "#{@S[t].to_s(2)}"
            #@Key_string << "#{@S[t].to_s(2)}"
            @Key_string << "#{@S[t]}"
            
            entrada << "Entrada M[#{x}] =#{mensaje[x]}                 "
            entrada << mensaje[x].to_s(2)
            
             
            texcifra << "Salida= C[#{x}] = #{ @S[t]^mensaje[x]}                  "
            texcifra << "#{(@S[t] ^ mensaje[x]).to_s(2)}"
            # @Cifrado<<"#{(@S[t] ^ mensaje[x]).to_s(2)}"
              @Cifrado<<"#{(@S[t] ^ mensaje[x])}"
              x = x + 1
           
               puts salida
               puts entrada
               puts texcifra 
               # p @S[t];
               #resul << @S[t].to_s
        end
        
        #  puts "Hacemo el xor"
        # p "Key stream " + resul.to_s
        # p "Mensaje " + mensaje.to_s
        # El mensaje y lo otor en decima pasar a binar
      
        # a = decimalPasaBinario(resul)
        # b = decimalPasaBinario(mensaje)
        # p binarioPasaDecimal(@Cifrado)
        # p  binarioPasaDecimal(@Cifrado)
        return @Cifrado
    end  

    
    def spritzPrga(mensaje)
        puts "Generación de secuenci cifrante y texto cifrado: "
        i = 0 
        f = 0 # j
        t = 0  #K
        w = 5
        x = 0
        z = 0
       mensaje.length.times do
            
            i = (i + w) % 256;
            f = (t + @S[ (f + @S[i])% 256 ])% 256;
            t = (i + t + @S[f])% 256; 
            
            puts i
            puts f
            puts t
            # intercambio    
            @S[i],@S[f] = @S[f],@S[i]
            
          
            z = (@S[ (f + @S[(i + @S[(z + t)% 256 ])% 256])% 256]) % 256;
           
           
             @Key_string << z
             
             #@Key_string << "#{@S[z]}"
         
            
             @Cifrado << "#{(@S[z] ^ mensaje[x])}"
              x = x + 1
         
        end
         p  @Key_string
         
        return @Cifrado
    end
    
    
    def vectPasaDecimal(dato)
            resul=[]
            aux =""
            tam = dato.size-1
            for i in 0..tam do
                    for j in 0..(dato[i].size - 1) do
                            aux <<  dato[i][j]
                    end
                      # aux = "0x" + aux
            
                       resul << aux
                      
                       aux=""
            end
            
            
            return resul
    end
        
    def decimalPasaBinario(resul)
                
        resulString = decimalPasaString(resul);
        resulBinario = stringPasaBinario( resulString);
        return resulBinario
    end
        
        
    #Se le pasa un vector de Decimal cada decima una leta.
    def decimalPasaString(decimal)
            
            string = ""
            
            decimal.map do |c|
               string << c
            end
           
            return string
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
        
        #mete cadena de simbolos
    def stringPasaDecimal(cadena)
            decimal = []
            cadena.bytes do |c|
                # 32 es el espacio Se pone un 0 para que se de 8 bit
                
                   decimal << c.to_s(10).to_i
            end
           
            return decimal
    end
        
         #Siempre se le pasan dos datos en binario de caracter del mismo tamaño
    def xorDec(datoA,datoB)
            resul = []
     
            tam = datoA.length - 1
            
                for i in 0..tam do
                  
                   resul << xor(datoA[i] ,datoB[i])
           
                end
               
               aux = vectPasaDecimal(resul)
              return aux
          
    end
        
        #Siempre se le pasan dos datos en binario de caracter del mismo tamaño
            #Siempre se le pasan dos datos en binario de caracter del mismo tamaño
    def xor(datoA,datoB)
            resul = []
            
            
            tam = datoA.length - 1
                
            for i in 0..tam do
                #resul << (datoA[i].to_i ^ datoB[i].to_i).to_s(2)
                resul << (datoA[i].to_i ^ datoB[i].to_i).to_s
            end
            
            return resul
    end
        
              
     #Pasamos un cadena de 0 y 1
    def binarioPasaDecimal(cadena)
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
