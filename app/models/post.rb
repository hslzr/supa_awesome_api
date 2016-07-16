class Post < ActiveRecord::Base
  belongs_to :user
  #validations
  validates :title, presence: true
  validates :body, presence: true
  #validates :slug, presence: true
  #validates :title, presence: true

end
