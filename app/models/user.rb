class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :subjects, dependent: :destroy
  has_one :subscription, dependent: :destroy
  has_many :invoice, dependent: :destroy
  has_one :color, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
