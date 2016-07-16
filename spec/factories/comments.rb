FactoryGirl.define do
  factory :comment do
    body "esto es un comentario"
    user_id 1
    post_id 1
  end
end
