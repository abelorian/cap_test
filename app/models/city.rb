class City < ActiveRecord::Base
  belongs_to :country
  has_many :customers

  validates :name, :country, presence: true
end
