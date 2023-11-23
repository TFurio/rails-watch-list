class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6}
  validates_uniqueness_of :movie_id, scope: :list_id

  belongs_to :movie
  belongs_to :list

  before_destroy :check_for_references

  private

  def check_for_references
    throw(:abort) if movie.bookmarks.any?
  end
end
