class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :doctor, optional: true
  #accepts_nested_attributes_for :doctor
  has_many :prescriptions
  accepts_nested_attributes_for(:prescriptions)
end
