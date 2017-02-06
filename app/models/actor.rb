class Actor < ActiveRecord::Base
  has_many :movies, dependent: :destroy

  def self.search(search)
    Actor.where("name LIKE ?", "%#{search}%")
  end
end
