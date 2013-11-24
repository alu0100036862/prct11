# racional.rb
require "gcd"

class Racional
        
  include Comparable
        
  # Se inicializa la fracción en su forma reducida haciendo uso de gcd
  def initialize(num, denom)

    raise TypeError, "El denominador debe ser mayor que cero" unless (denom != 0)

    div = gcd(num, denom)
    @num = num/div
    @denom = denom/div

  end

  # Gets y Sets de @num y @denom
  attr_reader :num, :denom

  #mostar por la consola la fraccion de la forma: a/b
  def to_s
    "#{num}/#{denom}"
  end

  #comparar que dos fracciones son iguales
  def ==(o)
    if o.instance_of? Racional
        @num == o.num && @denom == o.denom
    else
        false
    end
  end

  # Mostar la fraccion en formato flotante
  def to_f
    num.to_f/denom
  end

  # Calcular el valor absoluto de una fraccion con el metodo abs
  def abs
    Racional.new(num.abs, denom.abs)
  end

  # calcular el reciproco de una fraccion con el metodo reciprocal
  def reciprocal
    Racional.new(denom, num)
  end

  # Calcular el opuesto de una fraccion con -
  def -@
    Racional.new(-denom, num)        
  end

  # suma dos fracciones con + y dar el resultado de forma reducida
  def +(o)
    Racional.new(num*o.denom + o.num*denom, denom*o.denom)
  end

  # resta dos fracciones con - y dar el resultado de forma reducida
  def -(o)
    Racional.new(num*o.denom - o.num*denom, denom*o.denom)
  end

  #multiplica dos fracciones con * y dar el resultado de forma reducida
  def *(o)
    Racional.new(num*o.num,denom*o.denom)
  end

  # divide dos fracciones con / y dar el resultado de forma reducida
  def /(o)
    Racional.new(num*o.denom,denom*o.num)
  end

  # calcula el resto dos fracciones con % y dar el resultado de forma reducida
  def %(o)
    Racional.new(num%denom, o.num%o.denom)
  end

  # Comparación de mayor, mayor igual, menor, menor igual
  def <=>(o)
    return nil unless o.instance_of? Racional
    (num.to_f / denom) <=> (o.num.to_f / o.denom)
  end

end


