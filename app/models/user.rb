class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :registerable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  before_save :ensure_authentication_token
  has_many :nominations
  validates_format_of :email, with: /\A[\w\.%\+\-]+@(.*\.)?ucsd\.edu\z/i, on: :create, message: 'should be an UCSD email address.'

  def ensure_authentication_token
    self.authentication_token = generate_authentication_token if authentication_token.blank?
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end  
 
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end