class Camper < ApplicationRecord
  has_many :signups
  has_many :activities, through: :signups

  validates_presence_of :name
  validates_presence_of :age
  validates_inclusion_of :age, :in => 8..18

  def validate_correct_age
    if age < 8 || age > 17
      errors.add(:age, "camper must be between 8 and 17")
    end
  end

end
