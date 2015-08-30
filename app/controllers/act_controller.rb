class ActController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def long

  end

  def short

  end

  def orders

    @price = Price.all
    #respond_to do |format|
      render json: @price
    #end
  end

  def orders2

    if (params[:need]) > 0

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
      #respond_to do |format|
        render json: @test
      #end
    else
      render json: []
    end

  end
end
