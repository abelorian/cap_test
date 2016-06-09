# encoding: utf-8
class Rut
  # Retorna un rut sin puntos con guión y digito verificador
  # Ejemplo self.obtener_rut(16.356.635-4) -> 16356635-4
  def self.obtener_rut(identificacion)
    return identificacion if identificacion.start_with?('FALTA')
  
    return nil if identificacion.nil? or identificacion.squish == ''
    #elimina todo lo que no sea número ni la K, upcase para que quede la K mayúscula
    rut_dv = identificacion.upcase.gsub(/[^\dK]/,"")
    return nil if rut_dv == ""
    #chop elimina el último caracter, [-1,1] obtiene el último caracter, queda de la forma números-dv
    #.to_i.to_s para eleminar ceros al principio
    return rut_dv.chop.gsub(/[^\d]/,"").to_i.to_s + '-' + rut_dv[-1,1]
  end
  

  # Retorna true si el digíto verificador es correcto.
  def self.verificar_rut(rut)
    if rut and rut.downcase.gsub(/[^0-9\-k]/,"") =~ /(\d{7,8})-([\dk])/
      # solo las siguientes dos lineas son necesarias para obtener el dv
      dvt=$2;x=9;t=0;$1.reverse.split(//).each { |d| t+=d.to_i*x; x=(x==4) ? 9 : x - 1;}
      r=t % 11; dv=(r==10) ? "k" : r ;
      return "#{dv}"==dvt
    else
      return false
    end
  end

  def self.dv(rut)
    rut[-1..-1]
  end

  def self.rut(rut_completo)
    ans = Rut.obtener_rut(rut_completo)
    if ans.blank?
      ''
    else
      Rut.obtener_rut(rut_completo)[0..-3]
    end
  end

  #cambia el dígito verificador por el correcto
  def self.fix(rut)
    if rut and rut.downcase.gsub(/[^0-9\-k]/,"") =~ /(\d{7,8})-([\dk])/
      rut_sin_dv = $1
      dvt=$2;x=9;t=0;$1.reverse.split(//).each { |d| t+=d.to_i*x; x=(x==4) ? 9 : x - 1;}
      r=t % 11; dv=(r==10) ? "k" : r ;
      return "#{rut_sin_dv}-#{dv}"
    end
  end
end
