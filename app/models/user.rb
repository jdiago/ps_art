class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :latitude, :longitude

  validates :name, presence: true

  has_secure_password

  acts_as_gmappable
end
