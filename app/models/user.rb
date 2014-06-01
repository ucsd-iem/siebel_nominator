class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable, :token_authenticatable, :registerable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  email_name_regex  = '[\w\.%\+\-]+'
  domain_head_regex = '(?:[A-Z0-9\-]+\.)+'
  domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
  bad_email_message = "should look like an email address."
  validates_format_of :email, :with => email_regex, :on => :create, :message => bad_email_message
  
  before_save :ensure_authentication_token
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
  
  has_many :nominations
  
end