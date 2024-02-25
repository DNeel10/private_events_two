class Event < ApplicationRecord
  belongs_to :creator, class_name: :user, foreign_key: :user_id
  has_many :attendees, c: :user
end
