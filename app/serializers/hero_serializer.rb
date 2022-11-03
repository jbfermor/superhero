class HeroSerializer
  include JSONAPI::Serializer
  has_many :reviews
  attributes :alias, :real_name, :universe, :bio, :score
end
