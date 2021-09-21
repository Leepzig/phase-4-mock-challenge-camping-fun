class CamperActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :activites

  has_many :activites
end
