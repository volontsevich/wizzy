class Country < ActiveRecord::Base
  belongs_to :currency
  has_many :cities, dependent: :destroy
  validates :name, presence: true
end