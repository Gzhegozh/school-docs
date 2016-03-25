class User < ActiveRecord::Base
  before_create :build_profile
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile

  has_many :grades, through: :enrollments
  has_many :enrollments

  acts_as_messageable

  def name
    email
  end

  def mailboxer_email(object)
    email
  end
end
