class Customer < ActiveRecord::Base

  validates :email, presence: true

  before_save :sanitize_fields

  def sanitize_fields
    self.email = self.email.strip.downcase
  end

end
