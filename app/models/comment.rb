class Comment < ActiveRecord::Base
  validates :body, :user_id, :post_id, presence: true

  belongs_to :post
  belongs_to :user
end