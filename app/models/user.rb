class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :ensure_token
  has_many :comments

  def ensure_token
    begin
      self.token = Devise.friendly_token(10)
    end while self.class.exists?(token: self.token)
  end

end
