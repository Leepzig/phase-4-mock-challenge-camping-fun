class Signup < ApplicationRecord
  belongs_to :activity
  belongs_to :camper

  validates_presence_of :time
  validates_inclusion_of :time, :in => 0..23 

end
