=begin
Se usará el alfabeto sin Ñ, con W y sin espacios, luego el módulo
para las operaciones será m=26.
        -quitamos los espacio a todo.
        -poner una constante m=26

El cifrado opera sobre bloques de letras, y la clave es una palabra o
frase que se repite cuantas veces sea necesario.
        -compara tamños y saber cuantan veces se va extendre la clave
        -Contorlar si hay k partia la palabra.
        -crear otro funciao para meter la clave estendiad del mimso tamñao k el mensaje
        
Si la clave tiene longitud r, entonces el texto se divide en bloques de
longitud r y la clave se suma a cada bloque, sumando letra a letra
módulo 26, para producir el texto cifrado.

Dicho de otra forma, dada la clave k1 k2 ...kr introducida por el
usuario, la primera letra del texto original introducido por el usuario
se sustituye por otra que ocupa k1 posiciones más allá en el alfabeto,
la segunda por la que ocupa k2 posiciones más allá, y así
sucesivamente.
=end

class Vigenere
  
      def initialize(miAlfabeto)
      	      @miAlfabeto = miAlfabeto
      	      @tamAlfabeto = miAlfabeto.length
      end
      
      def comMensaj(mensaje)
           aux = mensaje
           
           aux = aux.gsub(/[A-Z]/,"")
           aux = aux.gsub(" ","")
           
           if (aux.length > 0) then
                puts "Mesaje erroneo no esta en el alfabeto"
           else
                puts "Mesaje correcto pertenece al alfabeto"
           end
      end
      
      def cifrar(mensaje,clave)
      
           puts "\n\n"
           puts "-"*25 + "CIFRANDO" + "-"*25
            mensajeCifrado = ""
    
           i = 0;
           
           puts "PALABRA CLAVE :                 " + clave
           puts "EL MENSAJE ORIGINAL:            " + mensaje
          
           verClave =""
           mensaje.each_char do | c |
            
                  if(c != " ")
                       #pos = ((@miAlfabeto.index(c) +  @miAlfabeto.index(clave[ i%clave.size ])) %  @tamAlfabeto)
                       
                       pos = (@miAlfabeto.index(c) + @miAlfabeto.index(clave[ i%clave.size ]))
                       verClave << clave[ i%clave.size ]
                       pos= (pos %  @tamAlfabeto)
                       mensajeCifrado <<  @miAlfabeto[pos]
                       i = i + 1
                  elsif 
                       verClave << " "
                  end
           end
           puts "ELEMENTO A SUMAR DE LA CLAVE:   " + verClave
           puts "El MENSAJE CIFRADO ES:          " +  mensajeCifrado 
         
           mensajeCifrado 
      end
      
    
      
      def cifrarAscii(mensaje,clave)
       
           puts "\n\n"
           puts "-"*25 + "CIFRANDO" + "-"*25
           mensajeCifrado = ""
        
           i = 0;
           
           puts "PALABRA CLAVE :                 " + clave
           puts "EL MENSAJE ORIGINAL:            " + mensaje
          
           verClave =""
        
           mensaje.each_char do | c |
            
                  if(c != " ")
                       
                       pos =((c.ord-"A".ord) + (clave[ i%clave.size ].ord-"A".ord) ) % @tamAlfabeto + "A".ord
                       verClave << clave[ i%clave.size ]
                        mensajeCifrado <<  pos.chr
                       i = i + 1
                  elsif 
                       verClave << " "
                  end
           end
           puts "ELEMENTO A SUMAR DE LA CLAVE:   " + verClave
           puts "El MENSAJE CIFRADO ES:          " +  mensajeCifrado 
         
           mensajeCifrado 
      end
     
      def descifrarAscii(mensajeCif,clave)
           i=0
           puts "\n\n"
           puts "-"*25 + "DESCIFRANDO" + "-"*25
           puts "MENSAJE CIFRADO :               " + mensajeCif
           mensaje = ""
           verClave =""
           mensajeCif.each_char do | c |
                   pos =((c.ord-"A".ord) - (clave[ i%clave.size ].ord-"A".ord) ) % @tamAlfabeto + "A".ord
                   verClave << clave[ i%clave.size ]
                   mensaje <<  pos.chr
                   i = i + 1
           end
           puts "ELEMENTO A SUMAR DE LA CLAVE:   " + verClave
           puts "El MENSAJE CIFRADO ES:          " +  mensaje    
      end
      
      def descifrar(mensajeCif,clave)
           i=0
           puts "\n\n"
           puts "-"*25 + "DESCIFRANDO" + "-"*25
           puts "MENSAJE CIFRADO :               " + mensajeCif
           mensaje = ""
           verClave =""
           mensajeCif.each_char do | c |
                     pos =  @miAlfabeto.index(c) - ( @miAlfabeto.index(clave[ i%clave.size ]))
                     verClave << clave[ i%clave.size ]
                     pos= (pos %  @tamAlfabeto) 
                     mensaje <<  @miAlfabeto[pos]
                     i = i + 1
           end
           puts "ELEMENTO A SUMAR DE LA CLAVE:   " + verClave
           puts "El MENSAJE CIFRADO ES:          " +  mensaje    
      end
      
end



# Cramos la maquina Vigenere que cifrara y codificara el alfabeto dato.
 miAlfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 maquina =  Vigenere.new(miAlfabeto);
 
  
   
#Ciframo y deciframo el mensaje
mensajeCif = maquina.cifrar("ESTE MENSAJE SE AUTODESTRUIRA","MISION")
maquina.descifrar(mensajeCif,"MISION")

maquina.comMensaj("ESTE MENSAJE SE AUTODESTRUIRA")
#Ciframo y deciframo el mensaje caracter Ascii
p "ASCII"
mensajeCif = maquina.cifrarAscii("ESTE MENSAJE SE AUTODESTRUIRA","MISION")
maquina.descifrarAscii(mensajeCif,"MISION")


mensajeCif = maquina.cifrar("DESASTRES","SOS")
maquina.descifrar(mensajeCif,"SOS")


