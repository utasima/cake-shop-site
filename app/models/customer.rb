class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliver_infos#, dependent: :destroy
  has_many :customers
  has_many :items
  has_many :orders
  has_many :cart_items
  accepts_nested_attributes_for :deliver_infos
  acts_as_paranoid

end
