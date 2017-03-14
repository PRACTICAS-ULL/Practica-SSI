require './rc4.rb'

=begin
Ejemplo:
Entrada:
Semilla de clave =2,5
Texto original: 1, 34
=end

puts "Entrada"
puts "Semilla de clave =2,5"
puts "Texto original: 1, 34"


maquina =  Rc4.new([2,5])
puts "\n"
puts "Inicializacion"
puts "S = " + maquina.S.to_s
puts "K = " + maquina.K.to_s
puts "\n"
maquina.algoritmoKSA
puts "\n"

#Mensaje es en decimal
cifrado = maquina.spritzPrga([1,34])


#maquina.descifrando
    
 