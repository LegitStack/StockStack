class HomeController < ApplicationController
  #before_action :authenticate_user!
  skip_before_filter  :verify_authenticity_token
 require 'csv'
  def index
#   @groups = Group.all
    @profiles = Profile.all

		if current_user.profile.title == "admin" or current_user.profile.title == "master"
    elsif current_user.profile.title == "processor"
    elsif current_user.profile.title == "realtor"
    elsif current_user.profile.title == "marketer"
    elsif current_user.profile.title == "escrow officer"
    else
    end

    @listofcolors = { 0=> "default", 1=> "danger", 2=> "warning", 3=> "success", 4=> "info", 5=> "active", 6=> "active"}

    if current_user.profile.title == "master"
      @allusers = User.all
    end

    respond_to do |format|
      format.html
      format.csv { send_data @allusers.to_csv } #render text: @records.to_csv }
    end
  end


  def import
    if current_user.profile.title == "admin" or current_user.profile.title == "master"
      User.import(params[:file])
      redirect_to root_path, notice: "Records Imported"
    else
      redirect_to root_path, notice: "No Records Imported; You are not Admin."
    end
  end

  def long

  end

  def short

  end

  def orders
    @profiles = Profile.all
    #respond_to do |format|
      render json: @profiles
    #end

  end
  def orders2
    @test = Profile.new(:name => params[:name])
    @test.save
    #respond_to do |format|
      render json: @test
    #end

  end
end
