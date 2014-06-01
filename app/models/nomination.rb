class Nomination < ActiveRecord::Base
  #set_primary_key :token
  cattr_reader :per_page
  @@per_page = 5
  
  extend FriendlyId
  friendly_id :nominee_name, use: :slugged
  
  attr_accessible :nominee_firstname, :nominee_lastname, :nominee_portrait, :misc_document, :nominee_statement, :nominee_resume, :nominee_transcript, :nominator_letter, :nominee_department, :nominee_ucsd_address, :nominee_ucsd_city, :nominee_ucsd_state, :nominee_ucsd_zip, :nominee_ucsd_phone, :nominee_ucsd_email, :nominee_address, :nominee_city, :nominee_state, :nominee_zip, :nominee_phone, :nominee_email
  validates_presence_of :nominee_firstname, :nominee_lastname, :nominee_department #, :nominee_ucsd_address, :nominee_ucsd_city, :nominee_ucsd_state, :nominee_ucsd_zip, :nominee_ucsd_email, :nominee_ucsd_phone, :nominee_address, :nominee_city, :nominee_state, :nominee_zip, :nominee_email, :nominee_phone

  email_name_regex  = '[\w\.%\+\-]+'
  domain_head_regex = '(?:[A-Z0-9\-]+\.)+'
  domain_tld_regex  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  email_regex       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
  bad_email_message = "should look like an email address."

  %w{nominator_letter nominee_resume nominee_transcript nominee_statement misc_document}.each do |a|
    has_attached_file a, :path => ":rails_root/uploads/:class/:id/:basename.:extension"
  end
  has_attached_file :nominee_portrait, :styles => { :medium => "512x512>", :thumb => "128x128>" }
  
  belongs_to :user

  after_create :send_confirmation
  
  def nominee_name
    @name = self.nominee_firstname + " " + self.nominee_lastname
  end

  def nominator_name
    @name = self.nominator_firstname + " " + self.nominator_lastname
  end

  def send_confirmation
    NominationMailer.confirmation(self).deliver
  end

  def update_nominator
    NominationMailer.update_notificaiton(self).deliver
  end

  def complete?
    @complete = true
    @complete = false unless self.nominator_letter_file_name
    @complete = false unless self.nominee_resume_file_name
    @complete = false unless self.nominee_portrait_file_name
    @complete = false unless self.nominee_transcript_file_name
    @complete = false unless self.nominee_statement_file_name
    return @complete
  end

  def self.search(search)
    if search
      where('nominee_firstname LIKE :q OR nominee_lastname LIKE :q OR nominator_firstname LIKE :q OR nominator_lastname LIKE :q or nominee_department LIKE :q', {:q =>"%#{search}%"})
    else
      scoped
    end
  end
  
  protected
  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def make_token
    self.token = secure_digest(Time.now, (1..17).map{ rand.to_s })
  end
end