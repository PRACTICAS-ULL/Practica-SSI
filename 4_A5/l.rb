class Pila 
  def initialize()
    @a=[]
  end
  def agregar(n)
    @a.push(n)
  end
  def eliminar
    @a.pop
  end
  def imprimir()
    return @a
  end
end

a=Pila.new
b=Pila.new
c=Pila.new
d=Pila.new
e=Pila.new

m=20
for i in 0..m-1
  a.agregar(rand(99).to_i)
end

for i in 0..m-1
  b.agregar(rand(99).to_i)
end
for i in 0..m-1
  c.agregar(rand(99).to_i)
end

for i in 0..m-1
  d.agregar(rand(99).to_i)
end

for i in 0..m-1
  e.agregar(rand(99).to_i)
end

puts a.imprimir

for i in 0..m-1
  begin
    b[i]=a.eliminar
    c[i]=b.eliminar
    d[i]=c.eliminar
    e[i]=d.eliminar
  end until a.empty?
end

puts ""

puts b.imprimir
puts "adfsdsfadsfdasfadsf"
puts c.imprimir
puts "adfsdsfadsfdasfadsf"
puts d.imprimir
puts "adfsdsfadsfdasfadsf"
puts e.imprimir