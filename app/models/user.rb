class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :age
    validates :height
    validates :weight
    validates :essential_cal
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :gender_id
    validates :level_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :level
  
end
