class Airport < ActiveRecord::Base
  belongs_to :city

  validates :short_name, presence: true
end