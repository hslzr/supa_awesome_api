class SingleUserSerializer < ActiveModel::Serializer
  attributes :id,
             :name

  def name
    self.object.name || 'Usuario Anónimo'
  end
end