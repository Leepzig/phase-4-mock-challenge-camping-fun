class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time, :activity
  has_one :activity
  has_one :camper
end
