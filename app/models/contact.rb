class Contact < ApplicationRecord
  #mounting the iamge uploader to be used with the post model
  mount_uploader :profile_picture, ProfilePictureUploader

  validates :first_name, :email, presence: true
  validates_format_of :email, :with => /@/, :message => "Invalid email address"

  has_and_belongs_to_many :groups
  # accepts_nested_attributes_for :groups, allow_destroy: true, reject_if: :all_blank

  def self.search(search)
    if search
      where("first_name like :s or last_name like :s or email like :s or first_name || ' ' || last_name || ' ' || email like :s", :s => "%#{search}%")
    else
      scoped
    end
  end
end
