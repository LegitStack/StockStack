class ActController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def long

  end

  def short
    if !Price.find_by_id((params[:id])).blank?
      @open = Price.find_by_id((params[:id])).close
    else
      @open = rand(1..100)
    end

    @high = rand(@open..100.0)
    @close = rand(2.0..@high)
    if @open < @close
      @low = rand(1.0..@open)
    else
      @low = rand(1.0..@close)
    end

    @test = Price.new(:ticker => params[:name], :high => @high, :low => @low, :open => @open, :close => @close)
    @test.save
  end

  def orders

    #@price = Price.all
    @prices = Price.where("id < ?", 40)
    #respond_to do |format|
      render json: @prices
    #end
  end

  def orders2#sends me need (so a request for x amount), sends me id, (above this number), sends me name (name of ticker)
    if (params[:need]).to_i > 0

      if !Price.find_by_id(params[:id]).blank?
        @prices = Price.where("id > ? AND id < ?", params[:id].to_i, params[:id].to_i + params[:need].to_i)
      else
        @prices = Price.all
      end
      render json: @prices
    else
      render json: Price.all;
    end

  end
end
