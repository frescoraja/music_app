class Album < ActiveRecord::Base
  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :title, :band_id, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :year, numericality: { minumum: 1900, maximum: 9000 }
  validates :title, uniqueness: { scope: :band_id }
end
