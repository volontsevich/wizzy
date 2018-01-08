class Fare < ActiveRecord::Base
  belongs_to :dep_airport, class_name: 'Airport'
  belongs_to :arr_airport, class_name: 'Airport'
end