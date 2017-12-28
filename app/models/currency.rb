class Currency < ActiveRecord::Base
  has_many :countries

  validates :name, :rate, presence: true
end