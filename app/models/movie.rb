class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception
  # has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :check_for_references

  private

  def check_for_references
    throw(:abort) if bookmarks.any?
  end
end
