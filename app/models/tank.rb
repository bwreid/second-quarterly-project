# == Schema Information
#
# Table name: tanks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Tank < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user
  has_many :jobs
end
