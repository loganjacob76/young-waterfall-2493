class Studio < ApplicationRecord
  has_many :movies

  def all_actors
    self.movies.joins(:actors).order(age: :desc).pluck(:name).uniq
  end
end
