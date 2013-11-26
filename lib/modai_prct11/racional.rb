# racional.rb
require "./lib/modai_prct11/gcd.rb"

#=Implemente una clase Ruby para representar los números racionales.
#===Un número racional es un número con un numerador y un denominador de la forma. a/b
class Racional
        
  include Comparable
        
  #== Se inicializa la fracción en su forma reducida haciendo uso de gcd
  def initialize(num, denom)

    raise TypeError, "El denominador debe ser mayor que cero" unless (denom != 0)

    div = gcd(num, denom)
    @num = num/div
    @denom = denom/div

  end

  #== Gets y Sets de @num y @denom
  attr_reader :num, :denom

  #== mostar por la consola la fraccion de la forma: a/b
  def to_s
    "#{num}/#{denom}"
  end

  #== comparar que dos fracciones son iguales
  def ==(o)
    if o.instance_of? Racional
        @num == o.num && @denom == o.denom
    else
        false
    end
  end

  #== Mostar la fraccion en formato flotante
  def to_f
    num.to_f/denom
  end

  #== Calcular el valor absoluto de una fraccion con el metodo abs
  def abs
    Racional.new(num.abs, denom.abs)
  end

  #== calcular el reciproco de una fraccion con el metodo reciprocal
  def reciprocal
    Racional.new(denom, num)
  end

  #== Calcular el opuesto de una fraccion con -
  def -@
    Racional.new(-denom, num)        
  end

  #== suma dos fracciones con + y dar el resultado de forma reducida
  def +(o)
    
    if o.is_a? Integer
      o = Racional.new(o,1)
    end
    Racional.new(num*o.denom + o.num*denom, denom*o.denom)

  end

  #== resta dos fracciones con - y dar el resultado de forma reducida
  def -(o)

    if o.is_a? Integer
      o = Racional.new(o,1)
    end
    Racional.new(num*o.denom - o.num*denom, denom*o.denom)

  end

  #== multiplica dos fracciones con * y dar el resultado de forma reducida
  def *(o)

    if o.is_a? Integer
      o = Racional.new(o,1)
    end
    Racional.new(num*o.num,denom*o.denom)

  end

  #== Divide dos fracciones con / y dar el resultado de forma reducida
  def /(o)

    if o.is_a? Integer
      o = Racional.new(o,1)
    end
    Racional.new(num*o.denom,denom*o.num)

  end

  #== Calcula el resto dos fracciones con % y dar el resultado de forma reducida
  def %(o)

    if o.is_a? Integer
      o = Racional.new(o,1)
    end
    Racional.new(num%denom, o.num%o.denom)

  end

  #== GERRA DE LAS GALAXIAS : un metodo que proporciona la comparación de mayor, mayor igual, menor, menor igual
  def <=>(o)
    return nil unless o.instance_of? Racional
    (num.to_f / denom) <=> (o.num.to_f / o.denom)
  end

  #== El metodo coerce para onvierte el valor especificado en el tipo especificado.
  def coerce(other)
    return Racional.new(other,1), self
  end

end


