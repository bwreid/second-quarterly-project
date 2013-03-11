# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first           :string(255)
#  last            :string(255)
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  complete_list   :boolean          default(TRUE)
#

class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password, :password_confirmation, :username, :complete_list
  has_secure_password
  validates :username, :presence => true
  has_many :tanks

  def has_jobs?
    self.tanks.first.jobs.present?
  end

  def completed_jobs
    self.tanks.first.jobs.where( :completed => true).order( :created_at ).reverse
  end

  def incompleted_jobs
    self.tanks.first.jobs.where( :completed => false).order( :created_at ).reverse
  end
end
