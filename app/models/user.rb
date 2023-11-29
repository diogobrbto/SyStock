class User < ApplicationRecord

  before_create :generate_token

  private

  def generate_token
    self.token = SecureRandom.hex(20) while User.exists?(token: self.token)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
