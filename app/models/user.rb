class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :cart_create
  after_create :welcome_send

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart

  has_many :order_users
  has_many :orders, through: :order_users

  def cart_create
    Cart.create(user: self)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
