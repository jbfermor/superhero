class ReviewSerializer
  include JSONAPI::Serializer
  belongs_to :user
  belongs_to :hero
  attributes :text, :score
end
