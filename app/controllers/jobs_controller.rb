class JobsController < ApplicationController
  before_filter :is_logged_in

  def index
    @jobs = list if @auth.has_jobs?
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        @auth.tanks.first.jobs << @job
        @jobs = list
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.js {}
      else
        format.html { render action: "new" }
        format.js {}
      end
    end
  end

  def update
    @job = Job.find(params[:id])
    respond_to do |format|
      if @job.update_attributes(params[:job])
        @jobs = list
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    @jobs = list
    @job = @jobs.first
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.js { }
    end
  end

  def query
  end

  def import

    if params[:authentic].present?
      new_job = Job.new
      new_job.add_from_authentic_jobs(params[:authentic])
      @auth.tanks.first.jobs << new_job
    end

    if params[:idealist].present?
      new_job = Job.new
      new_job.add_from_idealist(params[:idealist])
      @auth.tanks.first.jobs << new_job
    end

    if params[:indeed].present?
      new_job = Job.new
      new_job.add_from_indeed(params[:indeed])
      @auth.tanks.first.jobs << new_job
    end

    if params[:signals].present?
      new_job = Job.new
      new_job.add_from_37signals(params[:signals])
      @auth.tanks.first.jobs << new_job
    end

    @jobs = list
  end

  def select
    @job = Job.find( params[:id] )
    render :json => @job
  end

  def order_list
    @auth.complete_list = !@auth.complete_list
    @auth.save
    @jobs = list
  end

  def complete
    @job = Job.find( params[:id] )
    @job.completed = !@job.completed
    @job.save
    @jobs = list
    @job = @jobs.first
  end

  def x
    # binding.pry
    if params[:url].include?("authenticjobs.com/jobs/")
      new_job = Job.new
      new_job.add_from_authentic_jobs(params[:url])
      @auth.tanks.first.jobs << new_job
    end
    if params[:url].include?("idealist.org")
      new_job = Job.new
      new_job.add_from_idealist(params[:url])
      @auth.tanks.first.jobs << new_job
    end
    if params[:url].include?("indeed.com")
      new_job = Job.new
      new_job.add_from_indeed(params[:url])
      @auth.tanks.first.jobs << new_job
    end
    if params[:url].include?("jobs.37signals.com/jobs")
      new_job = Job.new
      new_job.add_from_37signals(params[:url])
      @auth.tanks.first.jobs << new_job
    end
    redirect_to( params[:url] )
  end

  def scrape
  end

  def cscrape
    doc = Nokogiri::HTML(open( "http://www.authenticjobs.com/" ))

    n = 0

    while n < 5 do
      new_job = Job.new
      new_job.add_from_authentic_jobs('http://www.authenticjobs.com' + doc.xpath("//div[@id='listings-wrapper']/ul[@id='listings']/li/a")[n]['href'])
      @auth.tanks.first.jobs << new_job
      n += 1
    end

    @jobs = list
  end

end
