class Customer < ActiveRecord::Base
  has_many :payments
end
