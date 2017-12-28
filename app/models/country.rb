class Country < ActiveRecord::Base
  belongs_to :currency

  validates :name, presence: true
end