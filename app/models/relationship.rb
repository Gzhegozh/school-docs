class Relationship < ActiveRecord::Base
  belongs_to :parent, class: 'User'
  belongs_to :child, class: 'User'
end
