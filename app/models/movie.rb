class Movie < ActiveRecord::Base
  belongs_to :actor
  has_and_belongs_to_many :genres
end
