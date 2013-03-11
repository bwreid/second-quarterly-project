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

class Job < ActiveRecord::Base
  attr_accessible :company, :deadline, :description, :industry, :job_type, :location, :name, :tags, :url, :website, :tank_id, :lat, :lon
  validates :name, :url, :presence => true
  belongs_to :tank

  before_save :geocode

  def add_from_idealist(input)
    doc = Nokogiri::HTML(open(input))
    # NAME
    self[:name] = doc.xpath("//div[@id='contentHeader']/h1").text
    # COMPANY
    self[:company] = doc.xpath("//p[@id='listing-sub-title']/a").text
    # JOB LISTING URL
    self[:url] = input
    # # DESCRIPTION
    self[:description] = doc.xpath("//div[@id='listing-description']").text.gsub("\t","") + doc.xpath("//div[@id='listing-instructions']").text.gsub("\t","")
    # # JOB TYPE
    # self[:job_type] = doc.xpath("//section[@id='leader']/h4").text
    # # LOCATION (NOT GEO-LOCATED)
    self[:location] = doc.xpath("//div[@id='box-Location']/div[@class='body']/div[@class='contentGroup']/div[@class='content']/dl/dd").text
    # # WEBSITE URL
    # idealist_page = "http://www.idealist.org" + doc.xpath("//div[@id='contentHeader']/p[@id='listing-sub-title']/a").first.attributes['href'].text
    # new_doc = Nokogiri::HTML(open(idealist_page))
    # index = new_doc.xpath("//div[@class='contentGroup']/div[@class='content']/dl/dt").text.split(':').find_index("Website")
    # self[:website] = doc.xpath("//div[@class = 'title ']/a").first.attributes['href'].text
    self.save
    # # NEED TO MAKE CASES IN CASE SOMETHING BREAKS
  end

  def add_from_authentic_jobs(input)
    doc = Nokogiri::HTML(open(input))
    # NAME
    self[:name] = doc.xpath("//div[@class='role']/h1").text
    # COMPANY
    self[:company] = doc.xpath("//hgroup/h2").first.text.gsub(/[\t\n]/,"")
    # JOB LISTING URL
    self[:url] = input
    # DESCRIPTION
    self[:description] = doc.xpath("//div[@class='role']/section[@id = 'description']").text.gsub("\t","")
    # JOB TYPE
    self[:job_type] = doc.xpath("//section[@id='leader']/h4").text
    # LOCATION (NOT GEO-LOCATED)
    self[:location] = doc.xpath("//a[@id='location']/span").text
    # WEBSITE URL
    self[:website] = doc.xpath("//div[@class = 'title ']/a").first.attributes['href'].text
    self.save
    # NEED TO MAKE CASES IN CASE SOMETHING BREAKS
  end

  def add_from_indeed(input)
    doc = Nokogiri::HTML(open(input))
    # NAME
    self[:name] = doc.xpath("//b[@class='jobtitle']").text
    # COMPANY
    self[:company] = doc.xpath("//span[@class='company']").text
    # JOB LISTING URL
    self[:url] = input
    # DESCRIPTION
    self[:description] = doc.xpath("//span[@class='summary']").text
    # JOB TYPE
    # self[:job_type] = doc.xpath("//section[@id='leader']/h4").text
    # LOCATION (NOT GEO-LOCATED)
    self[:location] = doc.xpath("//span[@class='location']").text
    # # WEBSITE URL
    # self[:website] = doc.xpath("//div[@class = 'title ']/a").first.attributes['href'].text
    self.save
    # NEED TO MAKE CASES IN CASE SOMETHING BREAKS
  end

  def add_from_37signals(input)
    doc = Nokogiri::HTML(open(input))
    # NAME
    self[:name] = doc.xpath("//div[@class='listing-header-container']/h1").text
    # COMPANY
    self[:company] = doc.xpath("//span[@class='company']").text
    # JOB LISTING URL
    self[:url] = input
    # DESCRIPTION
    self[:description] = doc.xpath("//div[@class='listing-container']").text
    # JOB TYPE
    # self[:job_type] = doc.xpath("//section[@id='leader']/h4").text
    # LOCATION (NOT GEO-LOCATED)
    self[:location] = doc.xpath("//span[@class='location']").text.split(': ')[1]
    # # WEBSITE URL
    # self[:website] = doc.xpath("//div[@class = 'title ']/a").first.attributes['href'].text
    self.save
    # NEED TO MAKE CASES IN CASE SOMETHING BREAKS
  end

  def geocode
    result = Geocoder.search(self.location).first
    if result.present?
      self.lat = result.latitude
      self.lon = result.longitude
    end
  end

end
