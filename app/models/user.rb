require 'digest/sha2'

class User < ActiveRecord::Base

after_destroy :ensure_an_admin_remains
validate :password_must_be_present


attr_accessor :password_confirmation
attr_reader :password


scope :emailed, lambda{|t| where(:name => t)}


validates :user_email, :presence => true,:uniqueness => true,:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
validates :name, :presence => true
validates :password, :confirmation => true



	def User.authenticate(user_email, password)
    if user = find_by_user_email(user_email)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
	end

  def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "csl" + salt)
	end
  def User.encrypt_address(user_email, salt)
		Digest::SHA2.hexdigest(user_email + "@" + salt)
	end

	def User.is_admin?(user_email)
    User.find_by_user_email(user_email).role == "admin" ? true : false
  end


# 'password' is a virtual attribute
	def password=(password)
		@password = password
		
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
      self.hashed_address = self.class.encrypt_address(user_email,salt)
		end
	end
	
	private
	
	def password_must_be_present
		errors.add(:password, "Missing password") unless hashed_password.present?
	end
	
	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

	def ensure_an_admin_remains
		if User.count.zero?
			raise "Can't delete last user"
		end
	end

end
