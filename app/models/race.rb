class Race < ActiveRecord::Base
  validates :title, presence: true
  validates :title_id, presence: true
  validates :elevation_gain, presence: true
  validates :max_elevation, presence: true
  validates :distance, presence: true
end
