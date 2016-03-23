class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  belongs_to :user


  #validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
end
