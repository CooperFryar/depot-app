class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @time = Time.now.strftime("%l:%M %p")

    session[:counter] ||= 0

    session[:counter] += 1
  end
end
