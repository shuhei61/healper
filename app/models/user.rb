class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :age, numericality: { only_integer: true }
    validates :height, numericality: { allow_float: true }
    validates :weight, numericality: { allow_float: true }
    validates :essential_cal, numericality: { only_integer: true }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :gender_id
    validates :level_id
  end

  has_many :foods
  has_many :wants
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :level
  
end
