class NetflixMovie < ApplicationRecord
  validates :show_id, uniqueness: true
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :title, :genre, :year, :country ],
    using: {
      tsearch: { prefix: true }
    }
end
