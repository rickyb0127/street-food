class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_one :shopping_list
end
