class Group < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true

  has_and_blongs_to_many :contacts

end
