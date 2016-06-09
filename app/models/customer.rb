class Customer < ActiveRecord::Base
  belongs_to :city
  validates :name, :email, :city, :rut, presence: true
  validates :email, :rut, uniqueness: true
  validates :email, email: true
  validate :validate_rut
  before_save :fix_rut

  def validate_rut
    is_valid = Rut.verificar_rut(self.rut)
    errors.add(:rut, "Formato de rut o digito verificador incorrecto") unless is_valid
  end

  def fix_rut
    self.rut = Rut.fix(self.rut)
  end

end
