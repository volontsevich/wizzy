class City < ActiveRecord::Base
  belongs_to :country
  has_many :airports, dependent: :destroy
  validates :name, presence: true
end