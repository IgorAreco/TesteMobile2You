class NetflixMovie < ApplicationRecord
  validates :show_id, uniqueness: true
  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_location, -> (location_id) { where location_id: location_id }
  scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}
end
