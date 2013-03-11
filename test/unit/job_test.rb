# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  url         :text
#  name        :string(255)
#  description :text
#  company     :string(255)
#  industry    :string(255)
#  location    :string(255)
#  job_type    :string(255)
#  deadline    :date
#  website     :string(255)
#  tags        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tank_id     :integer
#  lat         :float
#  lon         :float
#  completed   :boolean          default(FALSE)
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
