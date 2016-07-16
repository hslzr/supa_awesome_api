class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  #validations
  validates :title, presence: true
  validates :body, presence: true
  #validates :slug, presence: true
  #validates :title, presence: true
  before_save :ensure_slug

  def ensure_slug
    self.slug = self.title.parameterize
  end
end
