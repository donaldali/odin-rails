class Event < ActiveRecord::Base
  scope :upcoming, -> { where('date_of >= :today', {today: Time.now.to_date}) }
  scope :past,     -> { where('date_of <  :today', {today: Time.now.to_date}) }
  
  validates :date_of,     presence: true
  validates :description, presence: true

  belongs_to :creator, class_name: 'User'
  has_many   :invitations, foreign_key: :attended_event_id
  has_many   :attendees, through: :invitations
end
