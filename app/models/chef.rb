class Chef < ApplicationRecord
  before_save :downcase_email, :chefname_format
  
  validates :chefname, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_secure_password
  
  private
    def downcase_email
      self.email = email.downcase
    end
    
    def chefname_format
      self.chefname = chefname.split.map(&:capitalize)*' '
    end
    
end