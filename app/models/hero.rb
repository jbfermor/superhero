class Hero < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def update_hero_score( score )
    reviews_data = 0
    reviews.each { |r| reviews_data += r.score }
    if score == 0
      update(score: score)
    else
      update( score: (reviews_data + score) / reviews.count )
    end
  end
end
