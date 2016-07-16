class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  #validations
  validates :title, presence: true
  validates :body, presence: true
  #validates :slug, presence: true
  #validates :title, presence: true

end
