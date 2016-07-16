class User < ActiveRecord::Base
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :ensure_token

  def ensure_token
    begin
      self.token = Devise.friendly_token(10)
    end while self.class.exists?(token: self.token)
  end

end
