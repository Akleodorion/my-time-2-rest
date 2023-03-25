class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_many :appliances, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :diplomas, dependent: :destroy
end
