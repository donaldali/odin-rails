class Post < ActiveRecord::Base
  validates :title,   presence: true
  validates :content, presence: true
  validates :user_id, presence: true, numericality: true

  belongs_to :user
  has_many   :comments
end