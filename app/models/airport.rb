class Airport < ActiveRecord::Base
  belongs_to :city
  enum company_name: {
      'Wizz Air': 0,
      'Ryan Air': 1
  }
  has_many :direct_connections
  has_many :connected_airports, through: :direct_connections
  has_many :inverse_direct_connections, class_name: "DirectConnection", foreign_key: "connected_airport_id"
  has_many :inverse_connected_airports, through: :inverse_direct_connections, source: :airport
  validates :short_name, presence: true
end