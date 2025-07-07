class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reports, dependent: :destroy
  
  def admin?
    admin
  end
  
  def full_name
    email.split('@').first.titleize
  end
end
