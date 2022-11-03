class HeroSerializer
  include JSONAPI::Serializer
  has_many :reviews, serializer: ReviewSerializer
  attributes :alias, :real_name, :universe, :bio, :score, :reviews
end
