require 'carrierwave/orm/activerecord'


class Grade < ActiveRecord::Base
  mount_uploader :certificate_template_path, CertificateTemplateUploader
  belongs_to :school

  has_many :users, through: :enrollments
  has_one :enrollment_form
  has_many :enrollments
  accepts_nested_attributes_for :enrollment_form
end
