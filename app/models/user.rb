class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :isadmin
  attr_accessor :password
  before_save :encrypt_password
  
  has_many :requests

  validates :password, :presence => { :on => :create, :message => "No puede estar vacio" },
    :confirmation => true
  validates :username, :uniqueness => true,
    :presence => { :message => "No puede estar vacio" }

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
