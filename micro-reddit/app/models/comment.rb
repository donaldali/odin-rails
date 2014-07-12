class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :user_id, presence: true, numericality: true
  validates :post_id, presence: true, numericality: true

  belongs_to :post
  belongs_to :user
end
