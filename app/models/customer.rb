class Customer < ActiveRecord::Base
  belongs_to :city
  validates :name, :email, :city, presence: true
  validates :email, uniqueness: true
end
