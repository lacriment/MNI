class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_ratings, dependent: :destroy
  has_many :watch_lists, dependent: :destroy
  has_many :comments, dependent: :destroy
end
