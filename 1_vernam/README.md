# Cifrado Vernam
En terminología moderna, un cifrado de Vernam es un cifrado de flujo en el que el 
texto en claro se combina, mediante la operación XOR, con un flujo de datos aleatorio o 
pseudoaleatorio del mismo tamaño, para generar un texto cifrado. 
El uso de datos pseudoaleatorios generados por un generador de números pseudoaleatorios
criptográficamente seguro es una manera común y efectiva de construir un cifrado en flujo. 

El RC4 es un ejemplo de cifrado de Vernam que se utiliza con frecuencia en Internet.
Desarrollado y publicado en 1920 por G.S Vernam de los laboratorios Bell y AT&T y especificado
en la patente 1310719 de los E.U.A, Vernam representa el caso límite del cifrado de Vigénere.
Vernam propone convertir el texto plano en una cadena de bits (la cual puede ser representada en código ASCII)
de manera que esto le da una mayor robustez  al cifrado ya que hasta ahora los algoritmos  
estudiados veían al carácter como la unidad más pequeña e puede ser representado en código ASCII) de manera que esto le da una mayor robustez al cifrado, ya que hasta ahora los algoritmos estudiados veían el caracter como unidad más pequeña e invisible durante el proceso de cifrado-descifrado, y Vernam viene a mostrar que cada carácter puede ser representado y utilizado durante el proceso en fracciones mas pequeñas, también sugiere emplear como clave una secuencia binaria aleatoria o pseudoaleatoria del mismo tamaño que el mensaje en claro, y de manera relevante que la clave fuese de un solo uso (cifrar para transmitir). Después aplicar una operación OR Exclusiva, bit a bit con estas dos cadenas para obtener el criptograma, así el texto cifrado no puede proporcionar información alguna al criptoanalista.

## Ejecución 
  * Solo bajar y hacer ruby vernam.rb
