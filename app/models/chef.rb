class Chef < ApplicationRecord
  before_save :downcase_email
  
  validates :chefname, presence: true, length: { maximum: 30 }
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                                    length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX }
  
  private
    def downcase_email
      self.email = email.downcase
    end
end