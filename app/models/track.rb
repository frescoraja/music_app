class Track < ActiveRecord::Base
  belongs_to :album
  has_one :band, through: :album, source: :band
  has_many :notes, dependent: :destroy

  validates :track_title, :album_id, :ord, :lyrics, presence: true
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id }
end
