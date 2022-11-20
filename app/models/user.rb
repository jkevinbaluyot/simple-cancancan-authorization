class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles

  has_many :articles

  def is_admin?
    roles.where(name: "admin").present?
  end
end
