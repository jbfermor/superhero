class Hero < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
