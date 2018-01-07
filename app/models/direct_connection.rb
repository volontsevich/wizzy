class DirectConnection < ActiveRecord::Base
  belongs_to :airport
  belongs_to :connected_airport, class_name: 'Airport'
end