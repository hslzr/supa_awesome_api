class SessionSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :token,
             :name
end
