require './a5.rb'

 
 #Algoritmo de flujo 64-bit
 #Semilla puesta en el ejercicio en los 3 registro.


 r1 = [1,0,0,1,0,0,0,1,0,0,0,1,1,0,1,0,0,0,1].reverse          #19
      #0->19
 r2 = [0,1,0,1,1,0,0,1,1,1,1,0,0,0,1,0,0,1,1,0,1,0].reverse    #22
 r3 = [1,0,1,1,1,1,0,0,1,1,0,1,1,1,1,0,0,0,0,1,1,1,1].reverse  #23

 cod = A5.new(r1,r2,r3)

 
 mensaje = "101" 
 codigoCifrado = cod.cifradoB(mensaje)
 cod.descifrar(codigoCifrado)