class Currency < ActiveRecord::Base
  has_many :countries, dependent: :destroy

  validates :name, presence: true
end