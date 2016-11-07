class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates_format_of :email, :with => /@/, :message => "Invalid email address"
end
