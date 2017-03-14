require './rc4.rb'

=begin
Ejemplo:
Entrada:
Semilla de clave = "Clave de 128 bit"
Texto original: 1, 34
=end


puts "Entrada"
puts "Semilla de clave =Clave de 128 bit"
puts "Texto original: Un saludo"

maquina =  Rc4.new([1,2]);
K = maquina.stringPasaDecimal("Clave de 128 bit")
maquina.nuevaClave(K)

puts "\n"
puts "Inicializacion"
puts "S = " + maquina.S.to_s
puts "K = " + maquina.K.to_s
puts "\n"
#maquina.algoritmoKSA
puts "\n"

    #Mensaje es en decimal
    mensaje =maquina.stringPasaDecimal("Un saludo") 
    #puts mensaje
    cifrado = maquina.prga(mensaje)
    maquina.descifrado

=begin
cifradoDeci = maquina.stringPasaDecimal(cifrado)
cifradoString = maquina.decimalPasaString(cifradoDeci)
puts "Cifrado Binario: " + cifrado.to_s
puts "Cifrado Decimal: " + cifradoDeci.to_s
puts "Cifrado string: " + cifradoString

=end

