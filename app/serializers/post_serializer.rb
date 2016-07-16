class PostSerializer < ActiveModel::Serializer
  attributes :id,
             :slug,
             :title,
             :body,
             :author,
             :created_at

  has_many :comments

  def author
    self.object.user.email
  end

end
