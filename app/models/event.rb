class Event < ApplicationRecord
  scope :upcoming_events, -> { where("date >= ?", DateTime.now) }
  scope :past_events, -> { where("date <= ?", DateTime.now) }

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true

  belongs_to :creator, class_name: "User", inverse_of: :created_events

  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee
end
