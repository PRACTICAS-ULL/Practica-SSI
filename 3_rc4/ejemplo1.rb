require './rc4.rb'




maquina =  Rc4.new([2,5]);
#a =[ "C","l","a","v","e"," ","de"," ","128"," ","bit"]



#maquina =  Rc4.new(a);
#p maquina.S
#p maquina.K
 
 maquina.algoritmoKSA
 #maquina.prga
# p maquina.S

p maquina.stringPasaBinario("Un saludo")
p maquina.stringPasaDecimal("Un saludo")

#video de ejemplo
pildora =  Rc4.new([1,2]);
K = pildora.stringPasaDecimal("Clave de 128 bit")
pildora.nuevaClave(K)
p K

pildora.algoritmoKSA

mensaje = pildora.stringPasaDecimal("Un saludo")


pildora.prga(mensaje)