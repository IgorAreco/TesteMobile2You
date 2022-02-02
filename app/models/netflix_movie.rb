class NetflixMovie < ApplicationRecord
  include PgSearch::Model
  validates :show_id, uniqueness: true
  pg_search_scope :search,
    against: [ :title, :genre, :year, :country ],
    using: {
      tsearch: { prefix: true }
    }
end
