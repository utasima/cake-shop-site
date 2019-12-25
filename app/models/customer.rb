class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :profile_image       

  
  has_many :deliver_infos
  has_many :orders
  has_many :order_items
  has_many :cart_items
  
  accepts_nested_attributes_for :deliver_infos
end

